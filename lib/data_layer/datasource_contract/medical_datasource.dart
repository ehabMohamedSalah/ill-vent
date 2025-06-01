
import 'package:ill_vent/data_layer/model/dr_response/appointment_response/create_appointment/patient_model.dart';
import 'package:ill_vent/data_layer/model/medical_response/qr_resonse/QrMedicalHistoryResponse.dart';

import '../../core/api/api_result.dart';
import '../model/medical_history_dataclass.dart';
import '../model/medical_response/MedicalResponse.dart';

abstract class MedicalDatasource{
  Future<ApiResult<MedicalResponse>> sendPatientData({required MedicalHistory patientModel});
  Future<ApiResult<QrMedicalHistoryResponse>> generateQr();
}