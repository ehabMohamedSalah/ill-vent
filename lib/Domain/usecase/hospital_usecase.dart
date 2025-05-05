import 'package:ill_vent/Domain/repo_contract/hospital_repo.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_result.dart';
import '../../data_layer/model/Hospital_response.dart';

@injectable
class HospitalUsecase{
  HospitalRepo hospitalRepo;
  HospitalUsecase(this.hospitalRepo);
  Future<ApiResult<List<HospitalResponse>>> call(){
   return hospitalRepo.getHospital();
  }
}