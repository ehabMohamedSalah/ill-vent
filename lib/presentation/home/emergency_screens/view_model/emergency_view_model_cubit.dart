import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/Domain/usecase/complete_emergency_usecase.dart';
import 'package:ill_vent/Domain/usecase/emergency_req_usecase.dart';
import 'package:ill_vent/Domain/usecase/emergency_status_usecase.dart';
import 'package:ill_vent/data_layer/model/emergency_response/EmergencyRequestResponse.dart';
import 'package:ill_vent/data_layer/model/emergency_response/compete_req_response/CompleteRequestResponse.dart';
import 'package:ill_vent/data_layer/model/emergency_response/emergency_status/EmergencyStatusResponse.dart';
import 'package:ill_vent/core/api/api_result.dart';
import 'package:ill_vent/data_layer/datasource_contract/emergency_datasource/dataclass/emergency_dataclass.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'emergency_view_model_state.dart';

@injectable
class EmergencyViewModelCubit extends Cubit<EmergencyViewModelState> {
  final EmergencyRequestUsecase emergencyRequestUsecase;
  final EmergencyStatusUsecase emergencyStatusUsecase;
  final CompleteEmergencyRequestUsecase completeEmergencyRequestUsecase;

  EmergencyViewModelCubit(
      this.emergencyRequestUsecase,
      this.emergencyStatusUsecase,
      this.completeEmergencyRequestUsecase,
      ) : super(EmergencyViewModelInitial());

  static EmergencyViewModelCubit get(context) => BlocProvider.of(context);

  Timer? _pollingTimer;
  int _pollCount = 0;
  String? _reqId;
  String? _lastStatus;

  Future<void> emergencyRequest({required EmergencyDataclass emergencyreq}) async {
    if (!isClosed) emit(EmergencyViewModelLoading());

    final response = await emergencyRequestUsecase.call(emergencyreq);

    if (response is SuccessApiResult<EmergencyRequestResponse>) {
      emit(EmergencyViewModelSuccess(response.data));
    } else if (response is ErrorApiResult<EmergencyRequestResponse>) {
      emit(EmergencyViewModelError(response.exception?.toString() ?? "Unknown error"));
    } else {
      emit(EmergencyViewModelError("Unknown error"));
    }
  }

  Future<void> emergencyStatus(String requestID) async {
    if (requestID.isEmpty) {
      emit(EmergencyViewModelError("Invalid request ID"));
      return;
    }

    _reqId = requestID;
    emit(EmergencyStatusLoading());

    _pollCount = 0;
    _lastStatus = null;
    _pollingTimer?.cancel();

    _pollingTimer = Timer.periodic(Duration(seconds: 1), (timer) async {
      if (isClosed) {
        timer.cancel();
        return;
      }

      _pollCount++;

      // ⏱️ Stop after 120 seconds
      if (_pollCount > 120) {
        timer.cancel();
        emit(EmergencyStatusRejected(null)); // null or dummy response if needed
        if (_reqId != null) {
          final requestIdAsInt = int.tryParse(_reqId!);
          if (requestIdAsInt != null) {
            await completeEmergencyRequest(requestIdAsInt);
          }
        }

        return;
      }

      try {
        final response = await emergencyStatusUsecase.call(_reqId!);

        if (response is SuccessApiResult<EmergencyStatusResponse>) {
          final hospitalResponse = response.data;
          final currentStatus = hospitalResponse?.data?.status;

          if (currentStatus == "Completed" || currentStatus == "Accepted") {
            timer.cancel();
            emit(HospitalFound(hospitalResponse!));
          } else if (currentStatus == "Rejected" || currentStatus == "AllRejected") {
            timer.cancel();
            emit(EmergencyStatusRejected(hospitalResponse!));
          } else if (_lastStatus != currentStatus) {
            _lastStatus = currentStatus;
            emit(EmergencyStatusUpdated(hospitalResponse!));
          }
          // else: don't emit if status hasn't changed
        } else if (response is ErrorApiResult<EmergencyStatusResponse>) {
          timer.cancel();
          emit(EmergencyStatusError(response.exception?.toString() ?? "Unknown error"));
        }
      } catch (e) {
        timer.cancel();
        emit(EmergencyStatusError("Unexpected error: ${e.toString()}"));
      }
    });
  }

  @override
  Future<void> close() {
    _pollingTimer?.cancel();
    return super.close();
  }

  Future<void> completeEmergencyRequest(int requestID) async {
    if (!isClosed) emit(CompleteEmergencyLoading());

    final response = await completeEmergencyRequestUsecase.call(requestID);

    if (response is SuccessApiResult<CompleteRequestResponse>) {
      emit(CompleteEmergencySuccess(response.data));
    } else if (response is ErrorApiResult<CompleteRequestResponse>) {
      emit(CompleteEmergencyError(response.exception?.toString() ?? "Unknown error"));
    } else {
      emit(CompleteEmergencyError("Unknown error"));
    }
  }
}
