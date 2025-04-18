part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}
final class AuthInitial extends AuthState {}





///  Register  ///

final class RegisterViewModelLoading extends AuthState {}

final class RegisterViewModelSuccess extends AuthState {
  final RegisterResponse response;

  RegisterViewModelSuccess(this.response);
}

final class RegisterViewModelFailure extends AuthState {
  final String error;

  RegisterViewModelFailure(this.error);
}

final class ConfirmEmailLoading extends AuthState{}
final class ConfirmEmailSuccess extends AuthState{
  final ConfirmEmailResponse response;
  ConfirmEmailSuccess(this.response);
}
final class ConfirmEmailError extends AuthState{
  final String error;
  ConfirmEmailError(this.error);
}

final class LoginLoading extends AuthState{}
final class LoginError extends AuthState{
  String error;
  LoginError(this.error);
}
final class LoginSuccess extends AuthState{
  LoginResponse response;
  LoginSuccess(this.response);
}

final class ReqPasswordResetLoading extends AuthState{}
final class ReqPasswordResetError extends AuthState{
  String error;
  ReqPasswordResetError(this.error);
}
final class ReqPasswordResetSuccess extends AuthState{
  ReqResetPassResponse response;
  ReqPasswordResetSuccess(this.response);
}

final class ResetPasswordLoading extends AuthState{}
final class ResetPasswordError extends AuthState{
  String error;
  ResetPasswordError(this.error);
}
final class ResetPasswordSuccess extends AuthState{
  ResetPassResponse response;
  ResetPasswordSuccess(this.response);
}