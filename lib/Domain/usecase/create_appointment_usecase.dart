
import 'package:ill_vent/data_layer/model/dr_response/appointment_response/create_appointment/patient_model.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_result.dart';
import '../../data_layer/datasource_contract/dr_datasource.dart';
import '../../data_layer/model/dr_response/appointment_response/create_appointment/CreateAppointmentResponse.dart';

@injectable
class CreateAppointmentUsecase{
  DrDatasource drDatasource;
  CreateAppointmentUsecase(this.drDatasource);

  Future<ApiResult<CreateAppointmentResponse>>  call(PatientModel patient){
   return drDatasource.createAppointment(patient);
  }
}