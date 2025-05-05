import 'package:ill_vent/core/api/api_result.dart';

import '../model/Hospital_response.dart';

abstract class HospitalDatasource{

 Future<ApiResult<List<HospitalResponse>>> getHospital();
}