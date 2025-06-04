
import 'package:ill_vent/data_layer/datasource_contract/emergency_datasource/dataclass/emergency_dataclass.dart';
import 'package:ill_vent/data_layer/datasource_contract/emergency_datasource/emergency_datasource.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_result.dart';
import '../../data_layer/model/emergency_response/EmergencyRequestResponse.dart';

@injectable
class EmergencyRequestUsecase{
  EmergencyDatasource emergencyDatasource;
  EmergencyRequestUsecase(this.emergencyDatasource);

  Future<ApiResult<EmergencyRequestResponse>> call(EmergencyDataclass emergencyModel){
    return emergencyDatasource.emergencyRequest(emergencyModel);
  }
}