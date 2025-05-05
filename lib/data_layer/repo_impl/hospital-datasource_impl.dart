

import 'package:ill_vent/core/api/api_result.dart';
import 'package:ill_vent/data_layer/datasource_contract/hospital_datasource.dart';
import 'package:ill_vent/data_layer/model/Hospital_response.dart';
import 'package:injectable/injectable.dart';

import '../../Domain/repo_contract/hospital_repo.dart';

@Injectable(as: HospitalRepo)
class HospitalRepoImpl extends HospitalRepo{
  HospitalDatasource hospitalDatasource;
  HospitalRepoImpl(this.hospitalDatasource);
  @override
  Future<ApiResult<List<HospitalResponse>>> getHospital()  {
    return hospitalDatasource.getHospital();
  }

}