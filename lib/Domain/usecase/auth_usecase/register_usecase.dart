
import 'package:ill_vent/Domain/repo_contract/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_result.dart';
import '../../../data_layer/model/auth_response/RegisterResponse.dart';

@injectable
class RegisterUsecase{
  AuthRepo authRepo;
  RegisterUsecase (this.authRepo);
  Future<ApiResult<RegisterResponse>> call({required String firstName, required String lastName, required String email, required String password}){
    return authRepo.register(firstName: firstName, lastName: lastName, email: email, password: password);
  }
}