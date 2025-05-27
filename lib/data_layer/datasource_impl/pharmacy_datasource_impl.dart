import 'package:dio/dio.dart';
import 'package:ill_vent/core/api/api_manager.dart';
import 'package:ill_vent/core/api/api_result.dart';
import 'package:ill_vent/core/api/endpoints.dart';
import 'package:ill_vent/data_layer/datasource_contract/pharmacy_datasource.dart';
import 'package:ill_vent/data_layer/model/PharmacyResponse.dart';
import 'package:injectable/injectable.dart';

import '../../core/cache/shared_pref.dart';
import '../../core/constant.dart';

@Injectable(as: PharmacyDatasource)
class PharmacyDatasourceImpl extends PharmacyDatasource {
  final ApiManager apiManager;
  final CacheHelper cacheHelper;

  PharmacyDatasourceImpl(this.apiManager, this.cacheHelper);

  @override
  Future<ApiResult<List<PharmacyResponse>>> getPharmacy() async {
    try {
      final token = await cacheHelper.getData<String>(Constant.tokenKey) ?? "";

      final response = await apiManager.getRequest(
        Endpoint: Endpoints.getPharmacy,
        headers: {
          'Authorization': "Bearer $token",
        },
      );

      final List dataList = response.data as List;
      final pharmacy = dataList
          .map((item) => PharmacyResponse.fromJson(item))
          .toList();

      return SuccessApiResult(pharmacy);

    } on DioException catch (dioError) {
      print("Dio error:");
      print("Message: ${dioError.message}");
      print("Response: ${dioError.response}");
      print("Status code: ${dioError.response?.statusCode}");

      return ErrorApiResult(Exception("DioException: ${dioError.message}"));
    } catch (error) {
      print("Other error: $error");
      return ErrorApiResult(Exception(error.toString()));
    }
  }
}
