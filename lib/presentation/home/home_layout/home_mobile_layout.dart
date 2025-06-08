import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ill_vent/presentation/home/tabs/1-shop_tab/shop_screen.dart';
import 'package:ill_vent/presentation/home/tabs/2-Pharmacy_tab/pharmacyScreen.dart';
import '../../../core/utils/colors_manager.dart';
 import '../tabs/1-shop_tab/layouts/shop_mobile_layout.dart';
import '../tabs/2-Pharmacy_tab/layouts/Pharmacy_mobile_layout.dart';
import '../tabs/3_home_tab/homeTabScreen.dart';
 import '../tabs/3_home_tab/layouts/HomeTabMobileLayout.dart';
import '../tabs/4-hospital_tab/hospital_screen.dart';
import '../tabs/4-hospital_tab/layouts/HospitalMobileLayout.dart';
import '../tabs/5-doctor-tab/dr_Screen.dart';
import '../tabs/5-doctor-tab/layouts/DoctorMobileLayout.dart';

class HomeMobileLayout extends StatefulWidget {

  @override
  State<HomeMobileLayout> createState() => _HomeMobileLayoutState();
}


class _HomeMobileLayoutState extends State<HomeMobileLayout> {
  int _currentIndex = 2;

  final List<Widget> _pages = [
    ShopMobileLayout(),
    PharmacyMobileLayout(),
    HomeTabMobileLayout(),
    HospitalMobileLayout(),
    DoctorMobileLayout(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        index: _currentIndex,
        backgroundColor: ColorManager.primaryColor,
        color: ColorManager.secondaryColor,
        items: <Widget>[
          Image.asset('assets/images/3_home&bottoms/Shop.png',color: Colors.white,height: 30,),
          Image.asset('assets/images/3_home&bottoms/Rod of Asclepius.png',color: Colors.white,height: 30),
          Image.asset('assets/images/3_home&bottoms/RescueButton.png',height: 45),
          Image.asset('assets/images/3_home&bottoms/Choice.png',color: Colors.white,height: 30),
          Image.asset('assets/images/3_home&bottoms/Lab Coat.png',color: Colors.white,height: 30),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
    );
  }
}
