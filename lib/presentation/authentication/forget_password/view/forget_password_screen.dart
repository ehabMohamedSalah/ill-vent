import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/core/di/di.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/presentation/authentication/view_model/cubit/auth_cubit.dart';

import '../../../../core/constant.dart';
import '../../../../core/resuable_component/LoginCustomFormField.dart';
import '../../../../core/resuable_component/sign_buttom.dart';
import '../../../../core/utils/colors_manager.dart';
 import '../../../../core/utils/routes_manager.dart';
import '../../../../core/utils/strings_manager.dart';
import '../../view_model/cubit/auth_intent.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isObsecure=true;
  late TextEditingController emailContrller;
  late TextEditingController passwordContrller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailContrller=TextEditingController();
    passwordContrller=TextEditingController();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailContrller.dispose();
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
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          SizedBox(height: 30,),
                          Align(
                              alignment: Alignment.center,
                              child: Text("Forget password",style: Appstyle.medium25(context),)),
                          SizedBox(height: 10,),
                        Text("Please enter your email\nassociated to your account",style: Appstyle.small15(context).copyWith(color: Colors.white70),),
                          SizedBox(height: 20,),
                          CustomFormField( maxLength: 50,title: StringsManager.email,controller: emailContrller,hintText: StringsManager.enterYourEmail,keyboard:TextInputType.emailAddress ,
                            validator: (value){
                              if (!RegExp(Constant.regExValidateEmail).hasMatch(value ?? "")) {
                                return StringsManager.notValidEmail;
                              }
                            },),BlocConsumer<AuthCubit,AuthState>(
                              builder: (context, state) {
                                return SizedBox(
                                  width: 150,
                                  height: 50,
                                  child: SignButton(
                                    text: "Continue",
                                    TextColor: ColorManager.white,
                                    borderColor: Colors.transparent,
                                    linearGradient: false,
                                    backgroundColor: ColorManager.headlineColor,
                                    onTap: () {
                               context.read<AuthCubit>().doIntent(
                                   ReqPasswordResetIntent(email: emailContrller.text)
                               );

                                    },

                                  ),
                                );
                              },
                              listener: (context, state) {
                                if(state is ReqPasswordResetSuccess){
                                  Navigator.pushNamed(context, RouteManager.forgetOTP,arguments:emailContrller.text  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                  content: Text("Successful!")));
                                  () {};
                                  } else if (state is ReqPasswordResetError) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(content: Text(state.error)));
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
