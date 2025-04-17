
import 'package:ill_vent/Domain/repo_contract/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_result.dart';
import '../../../data_layer/model/auth_response/email_confirm/ConfirmEmail.dart';

@injectable
class ConfirmEmailUsecase{

  AuthRepo authRepo;
  ConfirmEmailUsecase(this.authRepo);


  Future<ApiResult<ConfirmEmailResponse>> call ({required String email, required String otp}){
   return authRepo.confirmEmail(email: email, otp: otp);
  }
}