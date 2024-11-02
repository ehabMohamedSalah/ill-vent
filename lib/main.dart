import 'package:flutter/material.dart';
import 'package:ill_vent/config/theme/appTheme.dart';
import 'package:ill_vent/core/utils/routes_manager.dart';
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
      routes: {
        RouteManager.homeScreenRoutes:(context) => HomeScreen(),
      },
      theme:AppTheme.lightTheme ,
      initialRoute: RouteManager.homeScreenRoutes ,

    );
  }
}


