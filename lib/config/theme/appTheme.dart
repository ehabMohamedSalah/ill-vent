import 'package:flutter/material.dart';

import '../../core/utils/colors_manager.dart';


class AppTheme{
  static ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0
      ),
      colorScheme: ColorScheme.fromSeed(
          seedColor: ColorManager.primaryColor,
          primary: ColorManager.primaryColor
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(

        backgroundColor: ColorManager.primaryColor,
        unselectedItemColor: ColorManager.primaryColor,
      ),
      textTheme: TextTheme(
        bodyMedium:   TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 18 ,
          overflow: TextOverflow.ellipsis,

        ),
      )
  );
}