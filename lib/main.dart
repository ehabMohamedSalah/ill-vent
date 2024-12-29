import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ill_vent/config/theme/appTheme.dart';
import 'package:ill_vent/core/utils/routes_manager.dart';
import 'package:ill_vent/presentation/auth/signIn/layouts/mobile_layout.dart';
import 'package:ill_vent/presentation/auth/signIn/login_screen.dart';
import 'package:ill_vent/presentation/auth/signUp/layouts/mobile_layout.dart';
import 'package:ill_vent/presentation/auth/signUp/register_Screen.dart';
import 'package:ill_vent/presentation/authentication/auth_screen.dart';
import 'package:ill_vent/presentation/authentication/forget_password/view/forget_password_screen.dart';
import 'package:ill_vent/presentation/authentication/forget_password/view/otp_forgetpass/forget_otp.dart';
import 'package:ill_vent/presentation/authentication/forget_password/view/repassword/view/repassword_scren.dart';
import 'package:ill_vent/presentation/authentication/login/view/login_screen.dart';
import 'package:ill_vent/presentation/authentication/register/view/register_screen.dart';
import 'package:ill_vent/presentation/authentication/register/view/widget/otp_screen.dart';
import 'package:ill_vent/presentation/home/home_layout/home_mobile_layout.dart';
import 'package:ill_vent/presentation/home/home_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:ill_vent/presentation/home/home_tab_screenss/FindHospital/FindingHospitalScreen.dart';
import 'package:ill_vent/presentation/home/home_tab_screenss/FindHospital/layouts/FindingMobileLayout.dart';
import 'package:ill_vent/presentation/home/home_tab_screenss/Scan_Patient/layouts/ScanMobileLayout.dart';
import 'package:ill_vent/presentation/home/home_tab_screenss/Scan_Patient/scan_screen.dart';
import 'package:ill_vent/presentation/home/home_tab_screenss/photo_of_sit/layouts/PhotoMobileLayout.dart';
import 'package:ill_vent/presentation/home/home_tab_screenss/photo_of_sit/photo_Screen.dart';
import 'package:ill_vent/presentation/home/tabs/resuable_widgets/Widget/deals/deal_list/dealCardWidget/DealDetailsScreen/DealDetailsScreen.dart';

import 'core/di/di.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();//law fe ay haga future m3molha await lazm tkhls abl mdkhol 3ala al runapp
  configureDependencies();
  runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ));
}





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
        RouteManager.authScreen:(context) => AuthScreen(),
        RouteManager.homeScreenRoutes:(context) => HomeScreen(),
        RouteManager.loginRoutes:(context) => LoginScreen(),
        RouteManager.registerOTP:(context)=>OtpScreen(),
        RouteManager.signUpRoutes:(context) => RegisterScreen(),
        RouteManager.scanScreen:(context) => ScanScreen(),
         RouteManager.photoScreen:(context) => PhotoScreen(),
        RouteManager.findingScreen:(context) => FindingScreen(),
RouteManager.forgetPassword:(context)=>ForgetPassword(),
        RouteManager.homeMobileLayout:(context) => HomeMobileLayout(),
        RouteManager.loginRoutesMobileLayout:(context) => LoginMobileLayout(),
        RouteManager.signUpRoutesMobileLayout:(context) => RegisterMobileLayout(),
        RouteManager.scanScreenMobileLayout:(context) => ScanMobileLayout(),
        RouteManager.photoScreenMobileLayout:(context) => PhotoMobileLayout(),
        RouteManager.findingScreenMobileLayout:(context) => FindingMobileLayout(),
RouteManager.forgetOTP:(context)=>ForgetOtpScreen(),
        RouteManager.repasswordScreen:(context)=>RepasswordScren(),

      },
      theme:AppTheme.lightTheme ,
      initialRoute:   RouteManager.authScreen  ,

    );
  }
}


