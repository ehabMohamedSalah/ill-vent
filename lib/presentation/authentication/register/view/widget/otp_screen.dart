import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ill_vent/core/di/di.dart';
import 'package:ill_vent/core/resuable_component/loading_circle.dart';
import 'package:ill_vent/core/resuable_component/toast_message.dart';
import 'package:ill_vent/presentation/authentication/view_model/cubit/auth_cubit.dart';
import 'package:ill_vent/presentation/authentication/view_model/cubit/auth_intent.dart';

import '../../../../../core/resuable_component/sign_buttom.dart';
import '../../../../../core/utils/Appstyle.dart';
import '../../../../../core/utils/colors_manager.dart';
import '../../../../../core/utils/routes_manager.dart';
import '../../../../../core/utils/strings_manager.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)?.settings.arguments as String?;

    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined,color: ColorManager.black),
          ),
        ),
        backgroundColor: ColorManager.primaryColor,
        body: Form(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                child: Image.asset("assets/images/auth/login&email.png"),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.secondaryColor),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                    color: ColorManager.secondaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        Text("Enter Authentication\nCode to finish", style: Appstyle.medium25(context), textAlign: TextAlign.center),
                        BlocConsumer<AuthCubit, AuthState>(
                          listener: (context, state) {
                            if (state is ConfirmEmailSuccess) {
                              Navigator.pushNamed(context, RouteManager.loginRoutes);
                              toastMessage(message: state.response.message??"", tybeMessage: TybeMessage.positive);
                             } else if (state is ConfirmEmailError) {
                              toastMessage(message: state.error??"", tybeMessage: TybeMessage.negative);
                            }
                          },
                          builder: (context, state) {
                            if(state is ConfirmEmailLoading)return Center(child: LoadingCircle(),);
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: OtpTextField(
                                numberOfFields: 6,
                                borderColor: Colors.grey,
                                fillColor: Colors.white,
                                enabledBorderColor: Colors.blue,
                                disabledBorderColor: Colors.grey.shade400,
                                filled: true,
                                borderRadius: BorderRadius.circular(10),
                                fieldWidth: 52,
                                fieldHeight: 52,
                                borderWidth: 2,
                                mainAxisAlignment: MainAxisAlignment.center,
                                margin: EdgeInsets.symmetric(vertical: 24, horizontal: 5.5),
                                showFieldAsBox: true,
                                onSubmit: (String code) {
                                  context.read<AuthCubit>().doIntent(EmailConfirmIntent(email: email??"", otp: code));
                                },
                              ),
                            );
                          },
                        ),
                        // ... rest of your widgets
                      ],
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
