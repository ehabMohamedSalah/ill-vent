
import 'package:ill_vent/Domain/repo_contract/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_result.dart';
import '../../../data_layer/model/auth_response/login_response/LoginResponse.dart';

@injectable
class LoginUsecase{
  AuthRepo authRepo;
  LoginUsecase(this.authRepo);

  Future<ApiResult<LoginResponse>> call({required String email, required String password}){
    return authRepo.Login(email: email, password: password);
  }
}