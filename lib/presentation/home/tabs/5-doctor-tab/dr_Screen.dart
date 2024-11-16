import 'package:flutter/material.dart';
import 'package:ill_vent/core/utils/size_config.dart';
import 'package:ill_vent/presentation/home/tabs/2-Pharmacy_tab/layouts/pharmacy_desktop_layout.dart';
import '../../../../core/utils/colors_manager.dart';
import '../../../../core/utils/shared/adaptive_layout/adaptive_layout.dart';
import 'layouts/DoctorDesktopLayout.dart';
import 'layouts/DoctorMobileLayout.dart';
import 'layouts/DoctorTabletLayout.dart';

class DoctorScreen extends StatelessWidget {
  DoctorScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor:   ColorManager.primaryColor,
      body: AdaptiveLayout(
        mobileLayout: (context) => const DoctorMobileLayout(),
        tabletLayout: (context) => const DoctorTabletLayout() ,
        desktopLayout: (context) => const DoctorDesktopLayout(),
      ),
    );
  }
}
