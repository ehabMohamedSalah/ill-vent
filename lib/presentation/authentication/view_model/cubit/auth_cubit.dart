import 'dart:developer';
import 'dart:ffi';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/Domain/usecase/auth_usecase/confirm_email.dart';
import 'package:ill_vent/Domain/usecase/auth_usecase/login_usecase.dart';
import 'package:ill_vent/Domain/usecase/auth_usecase/reqResetPasswordUsecase.dart';
import 'package:ill_vent/Domain/usecase/auth_usecase/reset_password_usecase.dart';
import 'package:ill_vent/data_layer/model/auth_response/email_confirm/ConfirmEmail.dart';
import 'package:ill_vent/data_layer/model/auth_response/login_response/LoginResponse.dart';
import 'package:ill_vent/data_layer/model/auth_response/reset_password/ReqResetPassResponse.dart';
import 'package:ill_vent/data_layer/model/auth_response/reset_password/ResetPassResponse.dart';
import 'package:injectable/injectable.dart';

import '../../../../Domain/usecase/auth_usecase/register_usecase.dart';
import '../../../../core/api/api_result.dart';
import '../../../../core/cache/shared_pref.dart';
import '../../../../core/di/di.dart';
import '../../../../data_layer/model/auth_response/RegisterResponse.dart';
import 'auth_intent.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  static AuthCubit get(context) => BlocProvider.of(context);
  final RegisterUsecase registerUsecase;
  final ConfirmEmailUsecase confirmEmailUsecase;
  LoginUsecase loginUsecase;
  ReqResetPasswordUsecase reqResetPasswordUsecase;
  ResetPasswordUsecase resetPasswordUsecase;
  @factoryMethod


  AuthCubit(this.registerUsecase,this.confirmEmailUsecase,this.loginUsecase,this.reqResetPasswordUsecase,this.resetPasswordUsecase) : super(AuthInitial());

  void doIntent(AuthIntent authIntent) {
    switch (authIntent) {
      case RegisterUserIntent():
        _register(intent: authIntent);
        break;

      case EmailConfirmIntent():
        _confirmEmail(intent: authIntent);
        break;
      case LoginIntent():
        _Login(Intent:authIntent);
        break;
      case ReqPasswordResetIntent():
         _reqResetPassword(Intent:authIntent);
         break;
      case ResetPasswordResetIntent():
        _ResetPassword(Intent:authIntent);
        break;
    }

  }
  _register({required RegisterUserIntent intent}) async {
    emit(RegisterViewModelLoading());
    final result = await registerUsecase(
      firstName: intent.firstName,
      lastName: intent.lastName,
      email: intent.email,
      password: intent.password,
    );

    if (result is SuccessApiResult<RegisterResponse>) {
      emit(RegisterViewModelSuccess(result.data!));
    } else if (result is ErrorApiResult<RegisterResponse>) {
      emit(RegisterViewModelFailure(result.exception.toString()));
      log(result.exception.toString());
    } else {
      emit(RegisterViewModelFailure("Unknown error occurred"));
    }
  }

  _confirmEmail({required EmailConfirmIntent intent})async{
    emit(ConfirmEmailLoading());
   var response= await confirmEmailUsecase.call(email: intent.email, otp: intent.otp);
   if(response is SuccessApiResult<ConfirmEmailResponse>){
     emit(ConfirmEmailSuccess(response.data!));
   } else if (response is ErrorApiResult<ConfirmEmailResponse>) {
     emit(ConfirmEmailError(response.exception.toString()));
     log(response.exception.toString());
   } else {
     emit(ConfirmEmailError("Unknown error occurred"));
   }
  }

  void _Login({required LoginIntent Intent}) async {
    emit(LoginLoading());
    var response = await loginUsecase.call(email: Intent.email, password: Intent.password);
    if (response is SuccessApiResult<LoginResponse>) {
      // حفظ حالة تسجيل الدخول
      final cacheHelper = getIt<CacheHelper>();
      await cacheHelper.setData<bool>("is_logged_in", true);

      emit(LoginSuccess(response.data!));
    } else if (response is ErrorApiResult<LoginResponse>) {
      emit(LoginError(response.exception.toString()));
    } else {
      emit(LoginError("UnKnow error occurred"));
    }
  }

  void _reqResetPassword({required ReqPasswordResetIntent Intent})async {
    emit(ReqPasswordResetLoading());
    var response=await reqResetPasswordUsecase.call(email: Intent.email);
    if(response is SuccessApiResult<ReqResetPassResponse>){
      emit(ReqPasswordResetSuccess(response.data!));
    }else if (response is ErrorApiResult<ReqResetPassResponse>){
      log(response.exception.toString());
      emit(ReqPasswordResetError(response.exception.toString()));
    }else{
      emit(ReqPasswordResetError( "UnKnow error occurred"));
    }
  }

  void _ResetPassword({required ResetPasswordResetIntent Intent}) async{
    emit(ResetPasswordLoading());
  var response= await resetPasswordUsecase.call(email: Intent.email, pass: Intent.pass, otp: Intent.otp);
    if(response is SuccessApiResult<ResetPassResponse>){
      emit(ResetPasswordSuccess(response.data!));
    }else if (response is ErrorApiResult<ResetPassResponse>){
      log(response.exception.toString());
      emit(ResetPasswordError(response.exception.toString()));
    }else{
      emit(ResetPasswordError( "UnKnow error occurred"));
    }
  }

}
