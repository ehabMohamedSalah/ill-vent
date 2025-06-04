import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';
import 'package:ill_vent/presentation/home/emergency_screens/FindHospital/google_map/widget/custom_google_map.dart';

import '../../../../../core/resuable_component/resuable_AppBar.dart';
import '../../../../../core/utils/routes_manager.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(navigatorScreen: RouteManager.homeScreenRoutes),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.w),
        child: SizedBox(
          height: 55.h,
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, RouteManager.mapScreen);
            },
            label: Text(
              "Ambulance reach you?",
              style: TextStyle(fontSize: 18.sp, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: ColorManager.primaryColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
               SizedBox(
                height: constraints.maxHeight * 0.4,
                width: double.infinity,
                child: CustomGoogleMap(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/3_home&bottoms/afterScan/Ambulance-amico 1.png",
                        height: 300,
                      ),
                      // Add any other scrollable content here
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
