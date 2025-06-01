
 import 'package:ill_vent/data_layer/datasource_contract/medical_datasource.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_result.dart';
import '../../../data_layer/model/medical_response/qr_resonse/QrMedicalHistoryResponse.dart';

@injectable
class GenerateQrUsecase{
  MedicalDatasource medicalDatasource;
  GenerateQrUsecase(this.medicalDatasource);
  Future<ApiResult<QrMedicalHistoryResponse>> call(){
   return medicalDatasource.generateQr();
  }
}