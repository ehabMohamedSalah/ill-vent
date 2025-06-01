
import 'package:ill_vent/data_layer/datasource_contract/medical_datasource.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_result.dart';
import '../../../data_layer/model/medical_response/MedicalResponse.dart';

@injectable
class MedicalHistoryUsecase{
  MedicalDatasource medicalDatasource;
  MedicalHistoryUsecase(this.medicalDatasource);

  Future<ApiResult<MedicalResponse>>  call(){
    return medicalDatasource.getMedical();
  }
}