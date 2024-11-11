import 'package:flutter/material.dart';
import 'package:ill_vent/config/theme/appTheme.dart';
import 'package:ill_vent/core/utils/routes_manager.dart';
import 'package:ill_vent/presentation/auth/signIn/login_screen.dart';
import 'package:ill_vent/presentation/auth/signUp/register_Screen.dart';
import 'package:ill_vent/presentation/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        RouteManager.homeScreenRoutes:(context) => HomeScreen(),
        RouteManager.loginRoutes:(context) => LoginScreen(),
        RouteManager.signUpRoutes:(context) => SignUp(),


      },
      theme:AppTheme.lightTheme ,
      initialRoute: RouteManager.loginRoutes ,


    );
  }
}


