import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ill_vent/config/theme/appTheme.dart';
import 'package:ill_vent/core/api/api_manager.dart';
import 'package:ill_vent/core/di/di.dart';
import 'package:ill_vent/core/myobserver.dart';
import 'package:ill_vent/core/utils/routes_manager.dart';
import 'package:ill_vent/presentation/authentication/auth_screen.dart';
import 'package:ill_vent/presentation/authentication/login/view/login_screen.dart';
import 'package:ill_vent/presentation/authentication/register/view/register_screen.dart';
import 'package:ill_vent/presentation/authentication/register/view/widget/otp_screen.dart';
import 'package:ill_vent/presentation/authentication/forget_password/view/forget_password_screen.dart';
import 'package:ill_vent/presentation/authentication/forget_password/view/otp_forgetpass/forget_otp.dart';
import 'package:ill_vent/presentation/authentication/forget_password/view/repassword/view/repassword_scren.dart';
import 'package:ill_vent/presentation/home/drawer/medical_history/medical_history_screen.dart';
import 'package:ill_vent/presentation/home/home_screen.dart';
import 'package:ill_vent/presentation/home/home_layout/home_mobile_layout.dart';

import 'package:ill_vent/presentation/home/home_tab_screenss/FindHospital/FindingHospitalScreen.dart';
import 'package:ill_vent/presentation/home/home_tab_screenss/FindHospital/layouts/FindingMobileLayout.dart';
import 'package:ill_vent/presentation/home/home_tab_screenss/Scan_Patient/layouts/ScanMobileLayout.dart';
import 'package:ill_vent/presentation/home/home_tab_screenss/Scan_Patient/scan_screen.dart';
import 'package:ill_vent/presentation/home/home_tab_screenss/photo_of_sit/layouts/PhotoMobileLayout.dart';
import 'package:ill_vent/presentation/home/home_tab_screenss/photo_of_sit/photo_Screen.dart';
import 'package:ill_vent/presentation/home/medical_history/view/medical_screen.dart';
import 'package:ill_vent/presentation/home/medical_history/view/qr_screen.dart';
import 'package:ill_vent/presentation/home/tabs/1-shop_tab/cart/view/cart_screen.dart';
import 'package:ill_vent/presentation/home/tabs/1-shop_tab/checkout/order_screen.dart';
import 'package:ill_vent/presentation/home/tabs/5-doctor-tab/Widgets/appointment_screen.dart';

import 'core/cache/shared_pref.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies(); // di
  ApiManager.init(); // initialize Dio
  Bloc.observer = MyBlocObserver();

  final cacheHelper = getIt<CacheHelper>();
  await cacheHelper.init();

  // Check if user is already logged in
  final bool isLoggedIn = await cacheHelper.getData<bool>("is_logged_in");

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(isLoggedIn: isLoggedIn),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return   ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          initialRoute:
          isLoggedIn ? RouteManager.homeScreenRoutes : RouteManager.authScreen,
          routes: {
            RouteManager.authScreen: (context) => AuthScreen(),
            RouteManager.homeScreenRoutes: (context) => HomeScreen(),
            RouteManager.loginRoutes: (context) => LoginScreen(),
            RouteManager.registerOTP: (context) => OtpScreen(),
            RouteManager.signUpRoutes: (context) => RegisterScreen(),
            RouteManager.scanScreen: (context) => ScanScreen(),
            RouteManager.photoScreen: (context) => PhotoScreen(),
            RouteManager.findingScreen: (context) => FindingScreen(),
            RouteManager.forgetPassword: (context) => ForgetPassword(),
            RouteManager.homeMobileLayout: (context) => HomeMobileLayout(),
            RouteManager.doctorAppointmentsScreen: (context) => DoctorAppointmentScreen(),
            RouteManager.cartScreen: (context) => CartScreen(),
            RouteManager.ordersScreen: (context) => OrderScreen(),


            RouteManager.scanScreenMobileLayout: (context) => ScanMobileLayout(),
            RouteManager.photoScreenMobileLayout: (context) => PhotoMobileLayout(),
            RouteManager.findingScreenMobileLayout: (context) =>
                FindingMobileLayout(),
            RouteManager.forgetOTP: (context) => ForgetOtpScreen(),
            RouteManager.repasswordScreen: (context) => RepasswordScren(),
            RouteManager.medicalHistoryScreen: (context) => MedicalHistoryForm(),
            RouteManager.medicalFloatScreen: (context) => MedicalFloatScreen(),
            RouteManager.qrFloatScreen: (context) => QrFloatScreen(),
          },
        );
      },
     );



  }
}
