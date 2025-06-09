import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../constant.dart';


@singleton
class ApiManager{
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: Constant.baseUrl,
      ),);
  }

  Future<Response> getRequest({
    required String Endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      var response = await dio.get(
        Endpoint,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        // لو response موجود بس status code مش 200
        return e.response!;
      } else {
        // مشاكل الشبكة الحقيقية مثلاً
        rethrow;
      }
    }
  }

  Future<Response> postRequest({
    required String endpoint,
    dynamic body,
    Map<String, dynamic>? headers,
    bool isRaw = false,
  }) async {
    try {
      return await dio.post(
        endpoint,
        data: isRaw ? body : (body ?? {}),
        options: Options(headers: headers),
      );
    } on DioError catch (e) {
      if (e.response != null) {
        // ✅ response موجود بس status code مش 200 → رجعه عادي
        return e.response!;
      } else {
        // ❌ Error زي انقطاع النت أو timeout
        rethrow;
      }
    }
  }


  Future<Response> put({
    required String Endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
  }) async {
    try {
      var response = await dio.put(
        Endpoint,
        queryParameters: queryParameters,
        data: data,
        options: Options(
          headers: headers,
        ),
      );
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        // لو السيرفر رد بـ status error، رجع response بدل ما ترمي استثناء
        return e.response!;
      } else {
        // مشاكل الشبكة أو timeout
        rethrow;
      }
    }
  }



  Future<Response> delete({
    required String Endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      var response = await dio.delete(
        Endpoint,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        // لو response موجود برغم وجود خطأ في status code
        return e.response!;
      } else {
        // مشكلة في الشبكة أو timeout
        rethrow;
      }
    }
  }


  Future<Response> patchRequest({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) async {
    try {
      var response = await dio.patch(
        endpoint,
        data: body,
        options: Options(
          headers: headers,
        ),
      );
      return response;
    } on DioError catch (e) {
      if (e.response != null) {

        return e.response!;
      } else {

        rethrow;
      }
    }
  }

}