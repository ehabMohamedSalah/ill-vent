///  Auth Intent ///
sealed class AuthIntent {}

class RegisterUserIntent extends AuthIntent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;



  RegisterUserIntent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,


  });
}

class EmailConfirmIntent extends AuthIntent{
final String email;
final String otp;
EmailConfirmIntent({required this.email,required this.otp});
}

class LoginIntent extends AuthIntent{
  String email;
  String password;
  LoginIntent({required this.email,required this.password});
}
class ReqPasswordResetIntent extends AuthIntent{
  String email;
  ReqPasswordResetIntent({required this.email});
}

class ResetPasswordResetIntent extends AuthIntent{
  String email;
  String pass;
  String otp;
  ResetPasswordResetIntent({required this.email,required this.otp,required this.pass});
}