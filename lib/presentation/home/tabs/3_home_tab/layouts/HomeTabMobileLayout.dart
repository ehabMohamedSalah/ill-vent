import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart'; // تأكد إنك مستورد الحزمة
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';
import 'package:ill_vent/core/utils/routes_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/resuable_component/LottieWidget.dart';
import '../../../../../core/constant.dart';

class HomeTabMobileLayout extends StatefulWidget {
  const HomeTabMobileLayout({super.key});

  @override
  State<HomeTabMobileLayout> createState() => _HomeTabMobileLayoutState();
}

class _HomeTabMobileLayoutState extends State<HomeTabMobileLayout> {
  bool showFab = false;

  @override
  void initState() {
    super.initState();
    _loadShowFab();
  }

  Future<void> _loadShowFab() async {
    final prefs = await SharedPreferences.getInstance();
    bool? hasMedicalHistory = prefs.getBool(Constant.medicalHistory);
    setState(() {
      showFab = hasMedicalHistory ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      floatingActionButton: showFab
          ? SpeedDial(
        backgroundColor: ColorManager.secondaryColor,
        icon: Icons.menu,
        activeIcon: Icons.close,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.history_edu_sharp),
            label: 'Medical History',
            onTap: () {
              Navigator.pushNamed(context,RouteManager.medicalFloatScreen);
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.receipt_long),
            label: 'QR Code',
            onTap: () {
              Navigator.pushNamed(context, RouteManager.qrFloatScreen);
            },
          ),
        ],
      )
          : null,
      body: Container(
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage("assets/images/background.png"), // path lel sora
    fit: BoxFit.cover, // cover | fill | contain | etc
    ), ),

        child: Column(
          children: [
            LottieWidget(
              Animation: 'assets/images/lottie/hospital.json',
              StaticImage: 'assets/images/lottie/hospital_image.png',
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  'Click Here',
                  style: Appstyle.small20(context).copyWith(color: Colors.red),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteManager.photoScreen);
                  },
                  child: Image.asset(
                    "assets/images/Emergency Button.png",
                    height: height * 0.32,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
