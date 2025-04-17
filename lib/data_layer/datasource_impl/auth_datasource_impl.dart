
import 'package:ill_vent/core/api/api_manager.dart';
import 'package:ill_vent/core/api/api_result.dart';
import 'package:ill_vent/data_layer/datasource_contract/auth_datasource.dart';
import 'package:ill_vent/data_layer/model/auth_response/RegisterResponse.dart';
import 'package:ill_vent/data_layer/model/auth_response/email_confirm/ConfirmEmail.dart';
import 'package:ill_vent/data_layer/model/auth_response/login_response/LoginResponse.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/endpoints.dart';

@Injectable(as:AuthDatasource )
class AuthDatasourceImpl extends AuthDatasource{

  ApiManager apiManager;
  AuthDatasourceImpl(this.apiManager);
  @override
  Future<ApiResult<RegisterResponse>> register({required String firstName, required String lastName, required String email, required String password}) async{
     try{
       var response=await apiManager.postRequest(
           endpoint:Endpoints.registerEndpoint,
           body:{
             "firstName":firstName,
             "surname": lastName,
             "email": email,
             "password": password,
             "confirmPassword": password
           }
       );
       RegisterResponse data=RegisterResponse.fromJson(response.data);
       if (data.success == true) {
         return SuccessApiResult(data);
       }
       return ErrorApiResult(
           Exception(data.message ?? "An unknown error occurred"));
     } catch (err) {
       return ErrorApiResult(
           Exception("Server connection error: ${err.toString()}"));
     }
  }

  @override
  Future<ApiResult<ConfirmEmailResponse>> confirmEmail({required String email, required String otp})async {
  try{
    var response= await apiManager.postRequest(endpoint: Endpoints.confirmEmailEndpoint, body: {
        "email": email,
        "otp": otp,
      },);
    var data=ConfirmEmailResponse.fromJson(response.data);
    if(data.success==true){
      return SuccessApiResult(data);;
    } return ErrorApiResult(
        Exception(data.message ?? "An unknown error occurred"));

  }catch(e){
    return ErrorApiResult(
        Exception("Server connection error: ${e.toString()}"));
  }
  }

  @override
  Future<ApiResult<LoginResponse>> login({required String email, required String password}) async{
 try{
   var response= await  apiManager.postRequest(
       endpoint: Endpoints.loginEndpoint, body: {
     "email": email ,
     "password": password,
   }
   );
   var result= LoginResponse.fromJson(response.data);
     if(result.success==true){
       return SuccessApiResult(result) ;
     } return ErrorApiResult(
       Exception(result.message ?? "An unknown error occurred"));



  }catch(err) {

   return ErrorApiResult(
       Exception(err.toString() ?? "An unknown error occurred"));

 }
 }
  }





