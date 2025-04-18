import 'package:ill_vent/Domain/repo_contract/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_result.dart';
import '../../../data_layer/model/auth_response/reset_password/ReqResetPassResponse.dart';

@injectable
class ReqResetPasswordUsecase{
  AuthRepo authRepo;
  ReqResetPasswordUsecase(this.authRepo);

  Future<ApiResult<ReqResetPassResponse>> call({required String email}){
   return authRepo.reqResetPassword(email: email);
  }
}