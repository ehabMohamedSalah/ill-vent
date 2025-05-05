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
      final token = await cacheHelper.getData<String>(Constant.tokenKey);

      final response = await apiManager.getRequest(
        Endpoint: Endpoints.getHospitals,
        headers: {
          'Authorization': "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU1ItNVg3OS0wMjUzIiwiZW1haWwiOiJ5b3Vzc2VmbW9oYW1tYWQwMDBAZ21haWwuY29tIiwianRpIjoiZDQxMGIyZmQtYTZhZC00Y2IyLTk5ODgtYmZlNTljNWNjZmU1IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiJVU1ItNVg3OS0wMjUzIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZ2l2ZW5uYW1lIjoiWW91c3NlZiBCYXJicmF3eSIsImVtYWlsX3ZlcmlmaWVkIjoiVHJ1ZSIsImV4cCI6MTc0NTU3NjQ3MiwiaXNzIjoiSWxsVmVudCIsImF1ZCI6IklsbFZlbnRVc2VycyJ9.ZvIhUHALX2a4-s79Uoc32XsqFNqW1G7mKNuIatH7lNo",

        },
      );

      final List dataList = response.data as List;
      final hospitals = dataList
          .map((item) => HospitalResponse.fromJson(item))
          .toList();

      return SuccessApiResult(hospitals);

    } on DioException catch (dioError) {
      // ✅ useful debug print
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
