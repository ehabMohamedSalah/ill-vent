import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/core/resuable_component/toast_message.dart';
import 'package:ill_vent/presentation/authentication/register/view/widget/otp_screen.dart';

import '../../../../core/constant.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resuable_component/LoginCustomFormField.dart';
import '../../../../core/resuable_component/RegisterCustomField.dart';
import '../../../../core/resuable_component/loading_circle.dart';
import '../../../../core/resuable_component/sign_buttom.dart';
import '../../../../core/utils/Appstyle.dart';
import '../../../../core/utils/colors_manager.dart';
 import '../../../../core/utils/routes_manager.dart';
import '../../../../core/utils/strings_manager.dart';
import '../../view_model/cubit/auth_cubit.dart';
import '../../view_model/cubit/auth_intent.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isConfirmObsecure=true;
  bool isObsecure=true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController genderController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController rePasswordController;
  late TextEditingController birthYearController;
  late TextEditingController birthMonthController;
  late TextEditingController birthDayController;
  late TextEditingController AgeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstNameController=TextEditingController();
    lastNameController=TextEditingController();
    genderController=TextEditingController();
    emailController=TextEditingController();
    passwordController=TextEditingController();
    rePasswordController=TextEditingController();
    birthYearController=TextEditingController();
    birthMonthController=TextEditingController();
    birthDayController=TextEditingController();
    AgeController=TextEditingController();


  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    firstNameController.dispose;
    lastNameController.dispose;
    genderController.dispose;
    emailController.dispose;
    passwordController.dispose;
    rePasswordController.dispose;
    birthYearController.dispose;
    birthMonthController.dispose;
    birthDayController.dispose;
    AgeController.dispose;
  }
  @override
  Widget build(BuildContext context) {
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
                  height:height * 0.2,
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
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          SizedBox(height: 30,),
                          Align(
                              alignment: Alignment.center,
                              child: Text("Enter your E-mail and\n password",style: Appstyle.medium25(context),)),
                          SizedBox(height: 20,),

                          RegisterCustomFormField(title: StringsManager.firstName, hintText: StringsManager.fNameHint, keyboard: TextInputType.text, controller: firstNameController, maxLength: 30,
                              validator:(value){
                                if(value==null||value.isEmpty){
                                  return StringsManager.notValidName;
                                }}

                          ),
                          SizedBox(height: 20,),

                          RegisterCustomFormField(title: StringsManager.lastName, hintText:  StringsManager.lNameHint , keyboard: TextInputType.text, controller: lastNameController, maxLength: 30,
                              validator:(value){
                                if(value==null||value.isEmpty){
                                  return StringsManager.notValidName;
                                }}

                          ),
                          SizedBox(height: 20,),

                          RegisterCustomFormField(title: StringsManager.emailAddress, hintText:  StringsManager.emailHint, keyboard: TextInputType.emailAddress, controller: emailController, maxLength: 30,
                              validator: (value) {
                                if (!RegExp(Constant.regExValidateEmail).hasMatch(value ?? "")) {
                                  return StringsManager.notValidEmail;
                                }
                              }
                          ),
                          SizedBox(height: 20,),

                          RegisterCustomFormField(
                            keyboard:TextInputType.visiblePassword ,
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
                              if(value==null||value.isEmpty){
                                return StringsManager.notValidName;
                              }
                              if(value.length<8){
                                return StringsManager.notValidPassword;
                              }
                              return null;
                            },
                            controller:passwordController ,
                            title: 'Password', hintText:  StringsManager.passHint, maxLength: 0,
                          ),
                          SizedBox(height: 20,),
                          RegisterCustomFormField(
                            keyboard:TextInputType.visiblePassword ,
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
                              if(value != passwordController.text ||value==null||value.isEmpty){
                                return StringsManager.notValidRepassword ;
                              }
                              return null;
                            },
                            controller:rePasswordController ,
                            title: 'Re-enter your password', hintText: StringsManager.rePassHint, maxLength: 0,
                          ),
                          SizedBox(height: 20,),

                          BlocConsumer<AuthCubit, AuthState>(
                            listener: (context, state) {
                              if (state is RegisterViewModelSuccess) {
                                Navigator.pushNamed(context, RouteManager.registerOTP,arguments:emailController.text  );

                                 toastMessage(
                                     message: "Register Success",
                                     tybeMessage:  TybeMessage.positive
                                 );
                              } else if (state is RegisterViewModelFailure) {
                                toastMessage(
                                    message: state.error,
                                    tybeMessage:  TybeMessage.negative
                                );
                              }
                            },
                            builder: (context, state) {
                              if(state is RegisterViewModelLoading){
                                return Center(child: LoadingCircle());
                              }
                              return SizedBox(
                                width: 150,
                                height: 50,
                                child: SignButton(
                                  text: "Next",
                                  TextColor: ColorManager.white,
                                  borderColor: Colors.transparent,
                                  linearGradient: false,
                                  backgroundColor: ColorManager.headlineColor,
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      context.read<AuthCubit>().doIntent(
                                        RegisterUserIntent(
                                          firstName: firstNameController.text
                                              .trim(),
                                          lastName: lastNameController.text
                                              .trim(),
                                          email: emailController.text.trim(),
                                          password: passwordController.text,

                                        ),
                                      );
                                    }
                                  })
                              );
                            },

                          ),
                          SizedBox(height: 10,),
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
