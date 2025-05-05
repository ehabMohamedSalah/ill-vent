
import 'package:ill_vent/core/api/api_result.dart';
import 'package:ill_vent/data_layer/model/PharmacyResponse.dart';

abstract class PharmacyDatasource{

  Future<ApiResult<List<PharmacyResponse>>> getPharmacy();
}