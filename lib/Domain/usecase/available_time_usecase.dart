import 'package:ill_vent/data_layer/datasource_contract/dr_datasource.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_result.dart';
import '../../data_layer/model/dr_response/available_time/AvailableTimeResponse.dart';

@injectable
class AvailableTimeUsecase{
  DrDatasource drDatasource;
  AvailableTimeUsecase(this.drDatasource);

  Future<ApiResult<List<AvailableTimeResponse>>> call({required String date}){
    return drDatasource.availableTime(date: date);
  }
}