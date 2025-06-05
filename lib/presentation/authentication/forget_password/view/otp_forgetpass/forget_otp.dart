import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ill_vent/core/di/di.dart';
import 'package:ill_vent/core/resuable_component/loading_circle.dart';
import 'package:ill_vent/presentation/authentication/view_model/cubit/auth_cubit.dart';
import 'package:ill_vent/presentation/authentication/view_model/cubit/auth_intent.dart';

import '../../../../../core/constant.dart';
import '../../../../../core/resuable_component/LoginCustomFormField.dart';
import '../../../../../core/resuable_component/sign_buttom.dart';
import '../../../../../core/resuable_component/toast_message.dart';
import '../../../../../core/utils/Appstyle.dart';
import '../../../../../core/utils/colors_manager.dart';
import '../../../../../core/utils/routes_manager.dart';
import '../../../../../core/utils/strings_manager.dart';

class ForgetOtpScreen extends StatefulWidget {
  const ForgetOtpScreen({super.key});

  @override
  State<ForgetOtpScreen> createState() => _ForgetOtpScreenState();
}

class _ForgetOtpScreenState extends State<ForgetOtpScreen> {
  @override
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isObsecure=true;
  late TextEditingController emailContrller;
  late TextEditingController passwordContrller;
  late TextEditingController RePasswordController;
  late String otp;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailContrller=TextEditingController();
    passwordContrller=TextEditingController();
    RePasswordController=TextEditingController();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailContrller.dispose();
  }
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)?.settings.arguments as String?;
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        backgroundColor: ColorManager.primaryColor,
        body: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                  height:height * 0.35,
                  width: double.infinity,
                  child: Image.asset("assets/images/auth/login&email.png")),
              Expanded(
                child: Container(

                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:  ColorManager.secondaryColor,
                    ),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40) ),
                    color: ColorManager.secondaryColor,
                  ),
                  child: SingleChildScrollView(

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(height: 30,),
                          Align(
                              alignment: Alignment.center,
                              child: Text("Enter Authentication\nCode to finish",style: Appstyle.medium25(context),)),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: OtpTextField(
                              numberOfFields: 6,
                              borderColor: Colors.grey, // لون الحدود العادي
                              fillColor: Colors.white, // لون الخلفية داخل الحقول
                              enabledBorderColor: Colors.blue, // لون الحدود عند التفعيل
                              disabledBorderColor: Colors.grey.shade400, // لون الحدود عند التعطيل
                              filled: true,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              fieldWidth: 52,
                              fieldHeight: 52,
                              borderWidth: 2,
                              mainAxisAlignment: MainAxisAlignment.center,
                              margin: EdgeInsets.symmetric(vertical: 24, horizontal: 5.5),
                              showFieldAsBox: true,
                              onSubmit: (String verificationCode) {
                                otp=verificationCode;
                                //VerificationViewModelCubit.get(context).Verify(resetCode: verificationCode.toString());
                              },
                            ),
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Text("A message will be sent to your e-mail\nplease fill the 6 numbers to make sure its you",style: Appstyle.small15(context),)),

                           CustomFormField( maxLength: 50,title: "New Password",controller: passwordContrller,hintText: "",keyboard:TextInputType.visiblePassword ,
                            obsecureText: isObsecure,
                            suffixIcon:IconButton( onPressed:(){

                              setState(() {
                                isObsecure=!isObsecure;
                              });
                            } ,
                                icon:Icon(
                                  isObsecure? Icons.visibility_off:Icons.visibility,
                                  size: 24,
                                  color: Colors.white,
                                ) ) ,
                            validator: (value){
                              if(value!.length < 8){
                                return StringsManager.notValidPassword;
                              }
                            },),
                           CustomFormField( maxLength: 50,title: "Confirm Password",controller: passwordContrller,hintText: "",keyboard:TextInputType.visiblePassword ,
                            obsecureText: isObsecure,
                            suffixIcon:IconButton( onPressed:(){

                              setState(() {
                                isObsecure=!isObsecure;
                              });
                            } ,
                                icon:Icon(
                                  isObsecure? Icons.visibility_off:Icons.visibility,
                                  size: 24,
                                  color: Colors.white,
                                ) ) ,
                            validator: (value){
                              if(passwordContrller!=RePasswordController){
                                return "Password Not Equal Re-Password";
                              }
                            },),
                     BlocConsumer<AuthCubit,AuthState>(
                         builder: (context, state) {
                           if(state is ResetPasswordLoading){
                             return Center(child: LoadingCircle(),);
                           }
                           return  SizedBox(
                             width: 150,
                             height: 50,
                             child: SignButton(
                               text: "Continue",
                               TextColor: ColorManager.white,
                               borderColor: Colors.transparent,
                               linearGradient: false,
                               backgroundColor: ColorManager.headlineColor,
                               onTap: () {
                                 if (formKey.currentState!.validate()) {
                                   print("====================================");
                                   print(email);
                                   print(otp);
                                   print(passwordContrller.text);
                                   print("====================================");

                                   context.read<AuthCubit>().doIntent(
                                     ResetPasswordResetIntent(
                                       email: email ?? "",
                                       otp: otp,
                                       pass: passwordContrller.text,
                                     ),
                                   );
                                 }
                               },

                             ),
                           );
                         },
                         listener: (context, state) {
                           if(state is ResetPasswordSuccess){
                             Navigator.pushNamed(
                                 context, RouteManager.homeScreenRoutes);
                             toastMessage(
                                 message: "Successful",
                                 tybeMessage:  TybeMessage.positive
                             );

                           }else if(state is ResetPasswordError){
                             toastMessage(
                                 message: state.error,
                                 tybeMessage:  TybeMessage.negative
                             );
                           }
                         },
                     ),


                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}
