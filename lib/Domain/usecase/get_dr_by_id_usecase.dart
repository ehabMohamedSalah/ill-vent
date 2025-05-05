
import 'package:ill_vent/data_layer/datasource_contract/dr_datasource.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_result.dart';
import '../../data_layer/model/dr_response/get_dr_by_id_response/GetDrByIdResponse.dart';

@injectable
class SpecificDoctorUsecase{
  DrDatasource drDatasource;
  SpecificDoctorUsecase(this.drDatasource);
  Future<ApiResult<GetDrByIdResponse>> call({required String id}){
    return drDatasource.getDrById(id: id);
  }
}