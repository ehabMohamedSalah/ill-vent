
import 'package:injectable/injectable.dart';

import '../../core/api/api_result.dart';
import '../../data_layer/datasource_contract/dr_datasource.dart';
import '../../data_layer/model/CancelAppointmentResponse.dart';

  @injectable
  class   CancelAppointmentUsecase{
  DrDatasource drDatasource;
  CancelAppointmentUsecase(this.drDatasource);
  Future<ApiResult<CancelAppointmentResponse>> call({required String drID}){
   return drDatasource.cancelAppointment(drID: drID);
  }
  }