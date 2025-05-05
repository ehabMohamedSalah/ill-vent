
import 'package:ill_vent/core/api/api_manager.dart';
import 'package:ill_vent/core/api/api_result.dart';
import 'package:ill_vent/core/api/endpoints.dart';
import 'package:ill_vent/data_layer/model/dr_response/available_time/AvailableTimeResponse.dart';
import 'package:ill_vent/data_layer/model/dr_response/get_dr_by_id_response/GetDrByIdResponse.dart';
import 'package:ill_vent/data_layer/model/dr_response/get_dr_response/GetDrResponse.dart';
import 'package:injectable/injectable.dart';

import '../datasource_contract/dr_datasource.dart';

@Injectable(as:DrDatasource )
class DrDatasourceImpl extends DrDatasource{
  ApiManager apiManager;
  DrDatasourceImpl(this.apiManager);
  @override
  Future<ApiResult<List<GetDrResponse>>> getDr() async{
    try{
      var response=await apiManager.getRequest(
          Endpoint: Endpoints.getDrEndpoint,
        headers: {
          'Authorization': "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU1ItNVg3OS0wMjUzIiwiZW1haWwiOiJ5b3Vzc2VmbW9oYW1tYWQwMDBAZ21haWwuY29tIiwianRpIjoiZDQxMGIyZmQtYTZhZC00Y2IyLTk5ODgtYmZlNTljNWNjZmU1IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiJVU1ItNVg3OS0wMjUzIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZ2l2ZW5uYW1lIjoiWW91c3NlZiBCYXJicmF3eSIsImVtYWlsX3ZlcmlmaWVkIjoiVHJ1ZSIsImV4cCI6MTc0NTU3NjQ3MiwiaXNzIjoiSWxsVmVudCIsImF1ZCI6IklsbFZlbnRVc2VycyJ9.ZvIhUHALX2a4-s79Uoc32XsqFNqW1G7mKNuIatH7lNo",

        },

      );
      final List dataList = response.data as List;
      final doctors = dataList
          .map((item) => GetDrResponse.fromJson(item))
          .toList();


      return SuccessApiResult(doctors);

    }catch (error) {
      print("Other error: $error");
      return ErrorApiResult(Exception(error.toString()));
    }
  }

  @override
  Future<ApiResult<GetDrByIdResponse>> getDrById({required String id})async {
    try{
      var response=await apiManager.getRequest(
        Endpoint: Endpoints.getDrById(id: id),
        headers: {
          'Authorization': "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU1ItNVg3OS0wMjUzIiwiZW1haWwiOiJ5b3Vzc2VmbW9oYW1tYWQwMDBAZ21haWwuY29tIiwianRpIjoiZDQxMGIyZmQtYTZhZC00Y2IyLTk5ODgtYmZlNTljNWNjZmU1IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiJVU1ItNVg3OS0wMjUzIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZ2l2ZW5uYW1lIjoiWW91c3NlZiBCYXJicmF3eSIsImVtYWlsX3ZlcmlmaWVkIjoiVHJ1ZSIsImV4cCI6MTc0NTU3NjQ3MiwiaXNzIjoiSWxsVmVudCIsImF1ZCI6IklsbFZlbnRVc2VycyJ9.ZvIhUHALX2a4-s79Uoc32XsqFNqW1G7mKNuIatH7lNo",

        },

      );
       final doctors =   GetDrByIdResponse.fromJson(response.data);

      return SuccessApiResult(doctors);

    }catch (error) {
      print("Other error: $error");
      return ErrorApiResult(Exception(error.toString()));
    }
  }

  @override
  Future<ApiResult<List<AvailableTimeResponse>>> availableTime({required String date}) async{
    try{
      var response=await apiManager.getRequest(
        Endpoint: Endpoints.avaialbleTime(date: date),
        headers: {
          'Authorization': "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJVU1ItNVg3OS0wMjUzIiwiZW1haWwiOiJ5b3Vzc2VmbW9oYW1tYWQwMDBAZ21haWwuY29tIiwianRpIjoiZDQxMGIyZmQtYTZhZC00Y2IyLTk5ODgtYmZlNTljNWNjZmU1IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiJVU1ItNVg3OS0wMjUzIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZ2l2ZW5uYW1lIjoiWW91c3NlZiBCYXJicmF3eSIsImVtYWlsX3ZlcmlmaWVkIjoiVHJ1ZSIsImV4cCI6MTc0NTU3NjQ3MiwiaXNzIjoiSWxsVmVudCIsImF1ZCI6IklsbFZlbnRVc2VycyJ9.ZvIhUHALX2a4-s79Uoc32XsqFNqW1G7mKNuIatH7lNo",

        },

      );
      var times = (response.data as List)
          .map((item) => AvailableTimeResponse.fromJson(item))
          .toList();
      return SuccessApiResult(times);

    }catch (error) {
      print("Other error: $error");
      return ErrorApiResult(Exception(error.toString()));
    }
  }


}