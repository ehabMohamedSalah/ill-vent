import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ill_vent/presentation/home/tabs/1-shop_tab/shop_screen.dart';
import 'package:ill_vent/presentation/home/tabs/2-Pharmacy_tab/pharmacyScreen.dart';
import '../../../core/utils/colors_manager.dart';
 import '../tabs/3_home_tab/homeTabScreen.dart';
 import '../tabs/4-hospital_tab/hospital_screen.dart';
import '../tabs/5-doctor-tab/dr_Screen.dart';

class HomeMobileLayout extends StatefulWidget {
  const HomeMobileLayout({super.key});

  @override
  State<HomeMobileLayout> createState() => _HomeMobileLayoutState();
}
int _currentIndex = 2;

// List of widgets corresponding to each item in the CurvedNavigationBar
final List<Widget> _pages = [
  ShopScreen(),
  PharmacyScreen(),
  HomeTabScreen(),
  HospitalScreen(),
  DoctorScreen(),

];
class _HomeMobileLayoutState extends State<HomeMobileLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  ColorManager.primaryColor,
      bottomNavigationBar: CurvedNavigationBar(
        index: 2,
        backgroundColor:   ColorManager.primaryColor,
          color:  ColorManager.secondaryColor,
        items: <Widget>[
          Image.asset('assets/images/3_home&bottoms/Shop.png',),
          Image.asset('assets/images/3_home&bottoms/Rod of Asclepius.png'),
          Image.asset('assets/images/3_home&bottoms/RescueButton.png'),
          Image.asset('assets/images/3_home&bottoms/Choice.png'),
          Image.asset('assets/images/3_home&bottoms/Lab Coat.png'),
        ],
        onTap: (index) {
          //Handle button tap
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}
