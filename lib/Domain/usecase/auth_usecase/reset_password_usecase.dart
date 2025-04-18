
import 'package:ill_vent/Domain/repo_contract/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_result.dart';
import '../../../data_layer/model/auth_response/reset_password/ResetPassResponse.dart';

@injectable
class ResetPasswordUsecase{
  AuthRepo authRepo;
  ResetPasswordUsecase(this.authRepo);

  Future<ApiResult<ResetPassResponse>> call({   required String email,   required String pass,   required String otp, }){
   return authRepo.resetPassword(email: email, pass: pass, otp: otp);
  }
}