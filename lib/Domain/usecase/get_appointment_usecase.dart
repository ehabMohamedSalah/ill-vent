

import 'package:ill_vent/data_layer/model/dr_response/appointment_response/get_user_appointment/GetUserAppointmentResponse.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_result.dart';
import '../../data_layer/datasource_contract/dr_datasource.dart';

@injectable
class GetAppointmentUsecase{
  DrDatasource drDatasource;
  GetAppointmentUsecase(this.drDatasource);

  Future<ApiResult<List<GetUserAppointmentResponse>>>  call(){
    return drDatasource.getAppointment();
  }

}