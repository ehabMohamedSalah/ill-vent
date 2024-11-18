import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ill_vent/config/theme/appTheme.dart';
import 'package:ill_vent/core/utils/routes_manager.dart';
import 'package:ill_vent/presentation/auth/signIn/login_screen.dart';
import 'package:ill_vent/presentation/auth/signUp/register_Screen.dart';
import 'package:ill_vent/presentation/home/home_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:ill_vent/presentation/home/home_tab_screenss/Scan_Patient/scan_screen.dart';
import 'package:ill_vent/presentation/home/home_tab_screenss/photo_of_sit/photo_Screen.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      routes: {
        RouteManager.homeScreenRoutes:(context) => HomeScreen(),
        RouteManager.loginRoutes:(context) => LoginScreen(),
        RouteManager.signUpRoutes:(context) => SignUp(),
        RouteManager.scanScreen:(context) => ScanScreen(),
         RouteManager.photoScreen:(context) => PhotoScreen(),

      },
      theme:AppTheme.lightTheme ,
      initialRoute: RouteManager.scanScreen  ,


    );
  }
}


