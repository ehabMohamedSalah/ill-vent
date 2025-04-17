

import 'package:ill_vent/Domain/repo_contract/auth_repo.dart';
import 'package:ill_vent/core/api/api_result.dart';
import 'package:ill_vent/data_layer/datasource_contract/auth_datasource.dart';
import 'package:ill_vent/data_layer/model/auth_response/RegisterResponse.dart';
import 'package:ill_vent/data_layer/model/auth_response/email_confirm/ConfirmEmail.dart';
import 'package:ill_vent/data_layer/model/auth_response/login_response/LoginResponse.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:AuthRepo )
class AuthRepoImpl extends AuthRepo{
  AuthDatasource authDatasource;
  AuthRepoImpl(this.authDatasource);
  @override
  Future<ApiResult<RegisterResponse>> register({required String firstName, required String lastName, required String email, required String password}) async{
   return await authDatasource.register(firstName: firstName, lastName: lastName, email: email, password: password);
  }

  @override
  Future<ApiResult<ConfirmEmailResponse>> confirmEmail({required String email, required String otp}) {
    return authDatasource.confirmEmail(email: email, otp: otp);
  }

  @override
  Future<ApiResult<LoginResponse>> Login({required String email, required String password}) {

      return authDatasource.login(email: email, password: password);
   }

}