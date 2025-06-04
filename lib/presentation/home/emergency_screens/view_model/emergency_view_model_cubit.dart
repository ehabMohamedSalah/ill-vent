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
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

part 'emergency_view_model_state.dart';

@injectable
class EmergencyViewModelCubit extends Cubit<EmergencyViewModelState> {
   final EmergencyRequestUsecase emergencyRequestUsecase;
  final EmergencyStatusUsecase emergencyStatusUsecase;
  final CompleteEmergencyRequestUsecase completeEmergencyRequestUsecase;

   EmergencyViewModelCubit(this.emergencyRequestUsecase, this.emergencyStatusUsecase,this.completeEmergencyRequestUsecase) : super(EmergencyViewModelInitial());

   static EmergencyViewModelCubit get(context) => BlocProvider.of(context);

  HubConnection? _hubConnection;
  Timer? _timer;
  String? _reqId;


  Future<void> emergencyRequest({required EmergencyDataclass emergencyreq}) async {
    if (!isClosed) emit(EmergencyViewModelLoading());

    final response = await emergencyRequestUsecase.call(emergencyreq);

    if (response is SuccessApiResult<EmergencyRequestResponse>) {
      emit(EmergencyViewModelSuccess(response.data));
    } else if (response is ErrorApiResult<EmergencyRequestResponse>) {
      emit(EmergencyViewModelError(response.exception.toString()));
    } else {
      emit(EmergencyViewModelError("Unknown error"));
    }
  }

   Future<void> emergencyStatus(String requestID) async {
    _reqId = requestID;
    emit(EmergencyStatusLoading());

    await _startSignalR();
    _startPolling();
  }

   Future<void> _startSignalR() async {
    _hubConnection = HubConnectionBuilder()
        .withUrl("https://illvent20240227133307.azurewebsites.net/emergencyHub")
        .build();

     _hubConnection?.on('HospitalAccepted', (data) {
      if (data != null && data.isNotEmpty && data[0] is Map<String, dynamic>) {
        _handleHospitalResponse(data[0] as Map<String, dynamic>); // معالجة الرد
      }
    });

    try {
      await _hubConnection?.start();
      await _hubConnection?.invoke("JoinEmergencyWaiting", args: [_reqId!]); // الانضمام للغرفة الخاصة بالطلب
    } catch (e) {
      print("SignalR connection error: $e");
    }
  }

   void _startPolling() {
    _timer = Timer.periodic(Duration(seconds: 10), (timer) async {
      final response = await emergencyStatusUsecase.call(_reqId!);
      if (response is SuccessApiResult<EmergencyStatusResponse>) {
        _handleHospitalResponse(response.data!.toJson());
      }
    });
  }


  void _handleHospitalResponse(Map<String, dynamic> hospitalDataMap) {
    _hubConnection?.stop(); // إيقاف اتصال SignalR لأن الرد وصل
    _timer?.cancel();       // إلغاء الـ polling

    // تحويل الـ Map إلى كائن EmergencyStatusResponse
    final hospitalResponse = EmergencyStatusResponse.fromJson(hospitalDataMap);

    // إصدار حالة أن المستشفى تم العثور عليه مع البيانات
    emit(HospitalFound(hospitalResponse));
  }

  @override
  Future<void> close() {

    _hubConnection?.stop();
    _timer?.cancel();
    return super.close();
  }

  Future<void> completeEmergencyRequest(int requestID) async {
    if (!isClosed) emit(CompleteEmergencyLoading());

    final response = await completeEmergencyRequestUsecase.call(requestID);

    if (response is SuccessApiResult<CompleteRequestResponse>) {
      emit(CompleteEmergencySuccess(response.data));
    } else if (response is ErrorApiResult<CompleteRequestResponse>) {
      emit(CompleteEmergencyError(response.exception.toString()));
    } else {
      emit(CompleteEmergencyError("Unknown error"));
    }
  }

}
