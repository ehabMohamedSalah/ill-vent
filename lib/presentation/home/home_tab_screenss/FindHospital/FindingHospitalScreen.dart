



import 'package:flutter/material.dart';
import 'package:ill_vent/presentation/home/home_tab_screenss/FindHospital/layouts/FindingDesktopLayout.dart';
import 'package:ill_vent/presentation/home/home_tab_screenss/FindHospital/layouts/FindingTabletLayout.dart';

import '../../../../core/utils/colors_manager.dart';
import '../../../../core/utils/shared/adaptive_layout/adaptive_layout.dart';
import '../../../../core/utils/size_config.dart';
import 'layouts/FindingMobileLayout.dart';

class FindingScreen extends StatelessWidget {
  FindingScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor:   ColorManager.primaryColor,

      body: AdaptiveLayout(
        mobileLayout: (context) =>   FindingMobileLayout(),
        tabletLayout: (context) => const FindingTabletLayout() ,
        desktopLayout: (context) => const FindingDesktopLayout(),
      ),
    );

  }
}
