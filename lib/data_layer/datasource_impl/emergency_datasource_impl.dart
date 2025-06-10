import 'package:ill_vent/core/api/api_manager.dart';
import 'package:ill_vent/core/api/api_result.dart';
import 'package:ill_vent/core/api/endpoints.dart';
import 'package:ill_vent/core/cache/shared_pref.dart';
import 'package:ill_vent/core/constant.dart';
import 'package:ill_vent/data_layer/datasource_contract/emergency_datasource/dataclass/emergency_dataclass.dart';
import 'package:ill_vent/data_layer/model/emergency_response/EmergencyRequestResponse.dart';
import 'package:ill_vent/data_layer/model/emergency_response/emergency_status/EmergencyStatusResponse.dart';
import 'package:injectable/injectable.dart';
import '../datasource_contract/emergency_datasource/emergency_datasource.dart';
import '../model/emergency_response/compete_req_response/CompleteRequestResponse.dart';

@Injectable(as:EmergencyDatasource )
class EmergencyDatasourceImpl extends EmergencyDatasource{
  ApiManager apiManager;
  CacheHelper cacheHelper;
  EmergencyDatasourceImpl(this.apiManager,this.cacheHelper);

  @override
  Future<ApiResult<EmergencyRequestResponse>> emergencyRequest(EmergencyDataclass emergencyModel)async {
     try{
       final token = await cacheHelper.getData<String>(Constant.tokenKey) ?? "";
       var response=  await apiManager.postRequest(
         endpoint: Endpoints.emergencyRequestEndpoint,
         headers: {
           'Authorization': "Bearer $token",
         },
         body: {
           "injuryDescription": emergencyModel.injuryDescription??"",
           "injuryPhotoBase64": emergencyModel.injuryPhotoBase64??null,
           "userLatitude": emergencyModel.userLatitude?? 30.0644,
           "userLongitude":emergencyModel.userLongitude?? 31.2497,
           "medicalHistoryQrCode": emergencyModel.medicalHistoryQrCode??"",
           "medicalHistoryToken": emergencyModel.medicalHistoryToken??"300BCB8C",
           "priority": 1
         },
     );
    var result=EmergencyRequestResponse.fromJson(response.data);
    if(result.success==false){
      return ErrorApiResult(Exception(result.message.toString()));
    }
    return SuccessApiResult(result);
     }catch(err){
       return ErrorApiResult(Exception(err.toString()));
     }
  }

  @override
  Future<ApiResult<EmergencyStatusResponse>> emergencyStatusResponse(String requestID)async {
    try {
      final token = await cacheHelper.getData<String>(Constant.tokenKey) ?? "";
      var response = await apiManager.getRequest(
        Endpoint: Endpoints.getEmergencyStatusEndpoint(requestID: requestID),
        headers: {
          'Authorization': "Bearer $token",
        },
      );
      var result = EmergencyStatusResponse.fromJson(response.data);
      return SuccessApiResult(result);
    } catch (err) {
      return ErrorApiResult(Exception(err.toString()));
    }
  }

  @override
  Future<ApiResult<CompleteRequestResponse>> completeEmergencyRequest(int requestID) async{
    try{
      final token = await cacheHelper.getData<String>(Constant.tokenKey) ?? "";
      var response=  await apiManager.postRequest(
        endpoint: Endpoints.completeEmergencyRequestEndpoint,
        headers: {
          'Authorization': "Bearer $token",
        },
        body:
          {
            "requestId":requestID
          }

      );
      var result=CompleteRequestResponse.fromJson(response.data);
      return SuccessApiResult(result);
    }catch(err){
      return ErrorApiResult(Exception(err.toString()));
    }
  }

}