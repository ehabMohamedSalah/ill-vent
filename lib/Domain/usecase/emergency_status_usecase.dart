
import 'package:ill_vent/data_layer/datasource_contract/emergency_datasource/emergency_datasource.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_result.dart';
import '../../data_layer/model/emergency_response/emergency_status/EmergencyStatusResponse.dart';

@injectable
class EmergencyStatusUsecase{
  EmergencyDatasource emergencyDatasource;
  EmergencyStatusUsecase(this.emergencyDatasource);

  Future<ApiResult<EmergencyStatusResponse>> call(String requestID){
   return emergencyDatasource.emergencyStatusResponse(requestID);
  }
}