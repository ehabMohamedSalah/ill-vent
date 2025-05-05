import 'package:ill_vent/core/api/api_result.dart';

import '../../data_layer/model/Hospital_response.dart';

abstract class HospitalRepo{

  Future<ApiResult<List<HospitalResponse>>> getHospital();
}