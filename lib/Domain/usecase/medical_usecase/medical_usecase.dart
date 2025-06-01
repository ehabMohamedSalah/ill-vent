
import 'package:injectable/injectable.dart';

import '../../../core/api/api_result.dart';
import '../../../data_layer/datasource_contract/medical_datasource.dart';
import '../../../data_layer/model/dr_response/appointment_response/create_appointment/patient_model.dart';
import '../../../data_layer/model/medical_history_dataclass.dart';
import '../../../data_layer/model/medical_response/MedicalResponse.dart';

@injectable
class UpdateMedicalHistoryUsecase{
  MedicalDatasource medicalDatasource;
  UpdateMedicalHistoryUsecase(this.medicalDatasource);

  Future<ApiResult<MedicalResponse>> call({required MedicalHistory patientModel}){
    return medicalDatasource.sendPatientData( patientModel: patientModel);
  }

}