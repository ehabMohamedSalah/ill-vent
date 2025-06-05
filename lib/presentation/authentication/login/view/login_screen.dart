import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ill_vent/core/resuable_component/LoginCustomFormField.dart';
import 'package:ill_vent/core/resuable_component/loading_circle.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';
import 'package:ill_vent/presentation/authentication/view_model/cubit/auth_intent.dart';

import '../../../../core/cache/shared_pref.dart';
import '../../../../core/constant.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resuable_component/sign_buttom.dart';
import '../../../../core/resuable_component/toast_message.dart';
import '../../../../core/utils/routes_manager.dart';
import '../../../../core/utils/strings_manager.dart';
import '../../view_model/cubit/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isObsecure = true;
  late TextEditingController emailContrller;
  late TextEditingController passwordContrller;
  late final CacheHelper cacheHelper;

  @override
  void initState() {
    super.initState();
    emailContrller = TextEditingController();
    passwordContrller = TextEditingController();
    cacheHelper = getIt<CacheHelper>();
  }

  @override
  void dispose() {
    emailContrller.dispose();
    passwordContrller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
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
                  height: height * 0.35,
                  width: double.infinity,
                  child: Image.asset("assets/images/auth/login&email.png")),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorManager.secondaryColor,
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: ColorManager.secondaryColor,
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Enter your E-mail and\n password",
                                style: Appstyle.medium25(context),
                              )),
                          CustomFormField(
                            maxLength: 50,
                            title: StringsManager.email,
                            controller: emailContrller,
                            hintText: StringsManager.enterYourEmail,
                            keyboard: TextInputType.emailAddress,
                            validator: (value) {
                              if (!RegExp(Constant.regExValidateEmail)
                                  .hasMatch(value ?? "")) {
                                return StringsManager.notValidEmail;
                              }
                            },
                          ),
                          CustomFormField(
                            maxLength: 50,
                            title: StringsManager.password,
                            controller: passwordContrller,
                            hintText: "",
                            keyboard: TextInputType.visiblePassword,
                            obsecureText: isObsecure,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObsecure = !isObsecure;
                                  });
                                },
                                icon: Icon(
                                  isObsecure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  size: 24,
                                  color: Colors.white,
                                )),
                            validator: (value) {
                              if (value!.length < 8) {
                                return StringsManager.notValidPassword;
                              }
                            },
                          ),
                          BlocConsumer<AuthCubit, AuthState>(
                            builder: (context, state) {
                              if (state is LoginLoading) {
                                return Center(child: LoadingCircle());
                              }
                              return SizedBox(
                                width: 150,
                                height: 50,
                                child: SignButton(
                                  text: "Log In",
                                  TextColor: ColorManager.white,
                                  borderColor: Colors.transparent,
                                  linearGradient: false,
                                  backgroundColor: ColorManager.headlineColor,
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    if (formKey.currentState!.validate()) {
                                      context.read<AuthCubit>().doIntent(
                                        LoginIntent(
                                            email: emailContrller.text,
                                            password: passwordContrller.text),
                                      );
                                    }
                                  },
                                ),
                              );
                            },
                            listener: (context, state) async {
                              if (state is LoginSuccess) {
                                FocusScope.of(context).unfocus(); // <<< قفل الكيبورد
                                await cacheHelper.setData<String>(
                                    Constant.tokenKey, state.response.token ?? "");
                                await cacheHelper.setData<String>(
                                    Constant.nameKey, state.response.userName ?? "");
                                await cacheHelper.setData<String>(
                                    Constant.emailKey, state.response.email ?? "");

                                Navigator.pushNamed(
                                    context, RouteManager.homeScreenRoutes);

                                toastMessage(
                                    message: "Login Success",
                                    tybeMessage: TybeMessage.positive);
                              } else if (state is LoginError) {
                                toastMessage(
                                    message:
                                    "You don't have an account or the password is incorrect.",
                                    tybeMessage: TybeMessage.negative);
                              }
                            },
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteManager.homeScreenRoutes);
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                StringsManager.quickRescue,
                                style: Appstyle.small20(context)
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          )
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
