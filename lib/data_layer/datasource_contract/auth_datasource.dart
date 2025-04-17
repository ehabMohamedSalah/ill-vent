import 'package:ill_vent/data_layer/model/auth_response/email_confirm/ConfirmEmail.dart';
import 'package:ill_vent/data_layer/model/auth_response/login_response/LoginResponse.dart';

import '../../core/api/api_result.dart';
import '../model/auth_response/RegisterResponse.dart';

abstract class AuthDatasource{
 Future<ApiResult<RegisterResponse>> register({required String firstName,required String lastName,required String email,required String password});
 Future<ApiResult<ConfirmEmailResponse>>confirmEmail({required String email,required String otp});
 Future<ApiResult<LoginResponse>>login({required String email,required String password});
}