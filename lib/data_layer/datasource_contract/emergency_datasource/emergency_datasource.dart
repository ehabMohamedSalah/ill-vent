
import 'package:ill_vent/core/api/api_result.dart';
import 'package:ill_vent/data_layer/model/emergency_response/EmergencyRequestResponse.dart';
import '../../model/emergency_response/compete_req_response/CompleteRequestResponse.dart';
import '../../model/emergency_response/emergency_status/EmergencyStatusResponse.dart';
import 'dataclass/emergency_dataclass.dart';

abstract class EmergencyDatasource{
 Future<ApiResult<EmergencyRequestResponse>> emergencyRequest(EmergencyDataclass emergencyModel);
 Future<ApiResult<EmergencyStatusResponse>> emergencyStatusResponse(String requestID);
 Future<ApiResult<CompleteRequestResponse>> completeEmergencyRequest(int requestID);


}