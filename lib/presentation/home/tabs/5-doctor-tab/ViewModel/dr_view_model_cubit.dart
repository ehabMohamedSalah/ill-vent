import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/Domain/entity/dr_entity.dart';
import 'package:ill_vent/Domain/usecase/cancel_appointment.dart';
import 'package:ill_vent/Domain/usecase/create_appointment_usecase.dart';
import 'package:ill_vent/Domain/usecase/doctor_usecase.dart';
import 'package:ill_vent/Domain/usecase/get_appointment_usecase.dart';
import 'package:ill_vent/core/api/api_result.dart';
import 'package:ill_vent/data_layer/model/CancelAppointmentResponse.dart';
import 'package:ill_vent/data_layer/model/dr_response/appointment_response/create_appointment/CreateAppointmentResponse.dart';
import 'package:ill_vent/data_layer/model/dr_response/appointment_response/create_appointment/patient_model.dart';
import 'package:ill_vent/data_layer/model/dr_response/appointment_response/get_user_appointment/GetUserAppointmentResponse.dart';
import 'package:ill_vent/data_layer/model/dr_response/get_dr_response/GetDrResponse.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../Domain/usecase/dr_usecase.dart';

part 'dr_view_model_state.dart';

@injectable
class DrViewModelCubit extends Cubit<DrViewModelState> {
  final DrUsecase doctorUsecase;
  final CreateAppointmentUsecase createAppointmentUsecase;
  final GetAppointmentUsecase getAppointmentUsecase;
  final CancelAppointmentUsecase cancelAppointmentUsecase;

  DrViewModelCubit(
      this.doctorUsecase,
      this.createAppointmentUsecase,
      this.getAppointmentUsecase,
      this.cancelAppointmentUsecase,
      ) : super(DrViewModelInitial());

  static DrViewModelCubit get(context) => BlocProvider.of(context);

  // internal list to manage current appointments
  List<GetUserAppointmentResponse> _appointments = [];

  Future<void> fetchDr() async {
    if (!isClosed) emit(DrLoading());

    final response = await doctorUsecase.call();

    if (response is SuccessApiResult<List<GetDrResponse>>) {
      emit(DrSuccess(response.data ?? []));
    } else if (response is ErrorApiResult<List<GetDrResponse>>) {
      emit(DrError(response.exception.toString()));
    } else {
      emit(DrError("Unknown error"));
    }
  }

  Future<void> createAppointment(PatientModel patient) async {
    if (!isClosed) emit(DrLoading());

    final response = await createAppointmentUsecase.call(patient);

    if (response is SuccessApiResult<CreateAppointmentResponse>) {
      emit(CreateAppointMentSuccess(response.data));
    } else if (response is ErrorApiResult<CreateAppointmentResponse>) {
      emit(CreateAppointMentError(response.exception.toString()));
      print(response.exception.toString());
    } else {
      emit(CreateAppointMentError("Unknown error"));
      print("Unknown error");
    }
  }

  Future<void> getAppointment() async {
    if (!isClosed) emit(GetAppointmentLoading());

    final response = await getAppointmentUsecase.call();

    if (response is SuccessApiResult<List<GetUserAppointmentResponse>>) {
      _appointments = response.data ?? [];
      emit(GetAppointmentSuccess(_appointments));
    } else if (response is ErrorApiResult<List<GetUserAppointmentResponse>>) {
      emit(GetAppointmentError(response.exception.toString()));
      print(response.exception.toString());
    } else {
      emit(CreateAppointMentError("Unknown error"));
      print("Unknown error");
    }
  }

  Future<void> cancelAppointment({required String drID}) async {
    if (!isClosed) emit(CancelAppointmentLoading());

    final response = await cancelAppointmentUsecase.call(drID: drID);

    if (response is SuccessApiResult<CancelAppointmentResponse>) {
      _appointments.removeWhere((appointment) => appointment.id == drID.trim());

      emit(GetAppointmentSuccess(List.from(_appointments))); // الحالة دي كفاية لتحديث الواجهة
    } else if (response is ErrorApiResult<CancelAppointmentResponse>) {
      emit(CancelAppointmentError(response.exception.toString()));
      print(response.exception.toString());
    } else {
      emit(CancelAppointmentError("Unknown error"));
      print("Unknown error");
    }
  }
}
