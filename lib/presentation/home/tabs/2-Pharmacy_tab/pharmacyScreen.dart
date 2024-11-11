import 'package:flutter/material.dart';
import 'package:ill_vent/core/utils/size_config.dart';
import 'package:ill_vent/presentation/home/tabs/2-Pharmacy_tab/layouts/pharmacy_desktop_layout.dart';
import '../../../../core/utils/colors_manager.dart';
import '../../../../core/utils/shared/adaptive_layout/adaptive_layout.dart';
import 'layouts/Pharmacy_mobile_layout.dart';
import 'layouts/pharmacy_tablet_layout.dart';

class PharmacyScreen extends StatelessWidget {
  PharmacyScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor:   ColorManager.primaryColor,
      body: AdaptiveLayout(
        mobileLayout: (context) => const PharmacyMobileLayout(),
        tabletLayout: (context) => const PharmacyTabletLayout() ,
        desktopLayout: (context) => const PharmacyDesktopLayout(),
      ),
    );
  }
}
