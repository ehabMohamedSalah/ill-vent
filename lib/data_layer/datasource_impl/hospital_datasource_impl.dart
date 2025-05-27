import 'package:dio/dio.dart';
import 'package:ill_vent/core/api/api_manager.dart';
import 'package:ill_vent/core/api/api_result.dart';
import 'package:ill_vent/core/api/endpoints.dart';

import 'package:ill_vent/data_layer/model/Hospital_response.dart';
import 'package:injectable/injectable.dart';

import '../../core/cache/shared_pref.dart';
import '../../core/constant.dart';
import '../datasource_contract/hospital_datasource.dart';

@Injectable(as: HospitalDatasource)
class HospitalDatasourceImpl extends HospitalDatasource {
  final CacheHelper cacheHelper;
  final ApiManager apiManager;

  HospitalDatasourceImpl(this.apiManager, this.cacheHelper);

  @override
  Future<ApiResult<List<HospitalResponse>>> getHospital() async {
    try {
      // جلب التوكن من الكاش
      final token = await cacheHelper.getData<String>(Constant.tokenKey) ?? "";

      final response = await apiManager.getRequest(
        Endpoint: Endpoints.getHospitals,
        headers: {
          'Authorization': "Bearer $token",
        },
      );

      final List dataList = response.data as List;
      final hospitals = dataList
          .map((item) => HospitalResponse.fromJson(item))
          .toList();

      return SuccessApiResult(hospitals);

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
