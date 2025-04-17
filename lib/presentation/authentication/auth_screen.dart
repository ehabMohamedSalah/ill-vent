import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';
import 'package:ill_vent/core/utils/routes_manager.dart';

import '../../core/resuable_component/sign_buttom.dart';
import '../../core/utils/Appstyle.dart';
import '../../core/utils/strings_manager.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorManager.primaryColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // يغلق الكيبورد عند الضغط في أي مكان
        },
        child: Column(
          children: [
            SizedBox(height: 50),
            SizedBox(height: 30),
            SizedBox(
              height: height * 0.35,
              width: double.infinity,
              child: Image.asset("assets/images/auth/Auth.png"),
            ),
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
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // ✅ توسيط العناصر داخل الـ Container
                    children: [
                      Text("Let's Get Started",
                          style: Appstyle.large30(context)),
                      SizedBox(height: 33),
                      SignButton(
                        text: "Log In",
                        TextColor: ColorManager.white,
                        borderColor: Colors.transparent,
                        linearGradient: false,
                        backgroundColor: ColorManager.headlineColor,
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteManager.loginRoutes);
                        },
                      ),
                      SizedBox(height: 20),
                      SignButton(
                        text: "Sign Up",
                        TextColor: ColorManager.white,
                        borderColor: Colors.transparent,
                        linearGradient: false,
                        backgroundColor: ColorManager.ternary,
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteManager.signUpRoutes);
                        },
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteManager.forgetPassword);
                        },
                        child: Text(
                          "Forget Password",
                          style: Appstyle.smallLabelTextBlack(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
