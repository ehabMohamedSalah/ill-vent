
import 'package:ill_vent/data_layer/datasource_contract/dr_datasource.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_result.dart';
import '../../data_layer/model/dr_response/get_dr_response/GetDrResponse.dart';

@injectable
class DrUsecase{
  DrDatasource drDatasource;
  DrUsecase(this.drDatasource);
  Future<ApiResult<List<GetDrResponse>>> call(){
    return drDatasource.getDr();
  }
}