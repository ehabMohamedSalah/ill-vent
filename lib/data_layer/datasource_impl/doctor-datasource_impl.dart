import 'package:ill_vent/core/api/api_manager.dart';
import 'package:ill_vent/core/api/api_result.dart';
import 'package:ill_vent/core/api/endpoints.dart';
import 'package:ill_vent/data_layer/model/CancelAppointmentResponse.dart';
import 'package:ill_vent/data_layer/model/dr_response/appointment_response/create_appointment/CreateAppointmentResponse.dart';
import 'package:ill_vent/data_layer/model/dr_response/appointment_response/create_appointment/patient_model.dart';
import 'package:ill_vent/data_layer/model/dr_response/appointment_response/get_user_appointment/GetUserAppointmentResponse.dart';
import 'package:ill_vent/data_layer/model/dr_response/available_time/AvailableTimeResponse.dart';
import 'package:ill_vent/data_layer/model/dr_response/get_dr_by_id_response/GetDrByIdResponse.dart';
import 'package:ill_vent/data_layer/model/dr_response/get_dr_response/GetDrResponse.dart';
import 'package:injectable/injectable.dart';

import '../../core/cache/shared_pref.dart';
import '../../core/constant.dart';
import '../datasource_contract/dr_datasource.dart';

@Injectable(as: DrDatasource)
class DrDatasourceImpl extends DrDatasource {
  final ApiManager apiManager;
  final CacheHelper cacheHelper;

  DrDatasourceImpl(this.apiManager, this.cacheHelper);

  @override
  Future<ApiResult<List<GetDrResponse>>> getDr() async {
    try {
      final token = await cacheHelper.getData<String>(Constant.tokenKey) ?? "";
      var response = await apiManager.getRequest(
        Endpoint: Endpoints.getDrEndpoint,
        headers: {
          'Authorization': "Bearer $token",
        },
      );
      final List dataList = response.data as List;
      final doctors = dataList.map((item) => GetDrResponse.fromJson(item)).toList();

      return SuccessApiResult(doctors);
    } catch (error) {
      print("Other error: $error");
      return ErrorApiResult(Exception(error.toString()));
    }
  }

  @override
  Future<ApiResult<GetDrByIdResponse>> getDrById({required String id}) async {
    try {
      final token = await cacheHelper.getData<String>(Constant.tokenKey) ?? "";
      var response = await apiManager.getRequest(
        Endpoint: Endpoints.getDrById(id: id),
        headers: {
          'Authorization': "Bearer $token",
        },
      );
      final doctor = GetDrByIdResponse.fromJson(response.data);

      return SuccessApiResult(doctor);
    } catch (error) {
      print("Other error: $error");
      return ErrorApiResult(Exception(error.toString()));
    }
  }

  @override
  Future<ApiResult<List<AvailableTimeResponse>>> availableTime({required String date, required String drID}) async {
    try {
      final token = await cacheHelper.getData<String>(Constant.tokenKey) ?? "";
      var response = await apiManager.getRequest(
        Endpoint: Endpoints.avaialbleTime(date: date, drID: drID),
        headers: {
          'Authorization': "Bearer $token",
        },
      );
      var times = (response.data as List)
          .map((item) => AvailableTimeResponse.fromJson(item))
          .toList();
      return SuccessApiResult(times);
    } catch (error) {
      print("Other error: $error");
      return ErrorApiResult(Exception(error.toString()));
    }
  }

  @override
  Future<ApiResult<CreateAppointmentResponse>> createAppointment(PatientModel patient) async {
    try {
      final token = await cacheHelper.getData<String>(Constant.tokenKey) ?? "";
      var response = await apiManager.postRequest(
        endpoint: Endpoints.createAppoitmentEndpoint,
        headers: {
          'Authorization': "Bearer $token",
        },
        body: {
          "doctorId": patient.doctorId,
          "appointmentDate": patient.appointmentDate,
          "startTime": patient.startTime,
          "patientName": patient.patientName,
          "patientAge": patient.patientAge,
          "patientGender": patient.patientGender,
          "patientPhoneNumber": patient.patientPhoneNumber
        },
      );
      var result = CreateAppointmentResponse.fromJson(response.data);

      return SuccessApiResult(result);
    } catch (error) {
      return ErrorApiResult(Exception(error.toString()));
    }
  }

  @override
  Future<ApiResult<List<GetUserAppointmentResponse>>> getAppointment()async {
    try{
      final token = await cacheHelper.getData<String>(Constant.tokenKey) ?? "";
      var response=await apiManager.getRequest(
        Endpoint: Endpoints.getUserAppoitmentEndpoint,
        headers: {
          'Authorization': "Bearer $token",
        },
      );
      List<GetUserAppointmentResponse> result = (response.data as List)
          .map((e) => GetUserAppointmentResponse.fromJson(e))
          .toList();
      return (SuccessApiResult(result));
    }catch(errMessage){
      return ErrorApiResult(Exception(errMessage.toString()));

    }
  }

  @override
  Future<ApiResult<CancelAppointmentResponse>> cancelAppointment({required String drID})async {
    try{
      final token = await cacheHelper.getData<String>(Constant.tokenKey) ?? "";

      var response= await apiManager.postRequest(endpoint: Endpoints.cancelAppointmentEndpoint(drID: drID), headers: {
        'Authorization': "Bearer $token",
      },);
      var result= CancelAppointmentResponse.fromJson(response.data);
      return SuccessApiResult(result);
    }catch(errMsg){
      return ErrorApiResult(Exception(errMsg.toString()));
    }
  }
}
