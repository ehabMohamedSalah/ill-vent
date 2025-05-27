import 'package:ill_vent/core/api/api_result.dart';
import 'package:ill_vent/data_layer/model/dr_response/appointment_response/create_appointment/CreateAppointmentResponse.dart';
import 'package:ill_vent/data_layer/model/dr_response/available_time/AvailableTimeResponse.dart';
import 'package:ill_vent/data_layer/model/dr_response/get_dr_response/GetDrResponse.dart';

import '../model/CancelAppointmentResponse.dart';
import '../model/dr_response/appointment_response/create_appointment/patient_model.dart';
import '../model/dr_response/appointment_response/get_user_appointment/GetUserAppointmentResponse.dart';
import '../model/dr_response/get_dr_by_id_response/GetDrByIdResponse.dart';

abstract class DrDatasource{
Future<ApiResult<List<GetDrResponse>>> getDr();
Future<ApiResult<GetDrByIdResponse>> getDrById({required String id});
Future<ApiResult<List<AvailableTimeResponse>>> availableTime({required String date,required String drID});
Future<ApiResult<CreateAppointmentResponse>> createAppointment(PatientModel patient);
Future<ApiResult<List<GetUserAppointmentResponse>>> getAppointment();
Future<ApiResult<CancelAppointmentResponse>> cancelAppointment({required String drID});

}