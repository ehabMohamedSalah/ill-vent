
import 'package:injectable/injectable.dart';

import '../../core/api/api_result.dart';
import '../../data_layer/datasource_contract/emergency_datasource/emergency_datasource.dart';
import '../../data_layer/model/emergency_response/compete_req_response/CompleteRequestResponse.dart';

@injectable
class CompleteEmergencyRequestUsecase{
  EmergencyDatasource emergencyDatasource;
  CompleteEmergencyRequestUsecase(this.emergencyDatasource);
  Future<ApiResult<CompleteRequestResponse>> call(int requestID){
   return emergencyDatasource.completeEmergencyRequest(requestID);
  }
}