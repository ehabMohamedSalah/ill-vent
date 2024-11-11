
import 'package:flutter/material.dart';
import 'package:ill_vent/core/utils/shared/adaptive_layout/adaptive_layout.dart';

import '../../../../core/utils/colors_manager.dart';
import '../../../../core/utils/size_config.dart';
import 'layouts/HospitalDesktopLayout.dart';
import 'layouts/HospitalMobileLayout.dart';
import 'layouts/HospitalTabletLayout.dart';

class HospitalScreen extends StatelessWidget {
  HospitalScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor:   ColorManager.primaryColor,
      body: AdaptiveLayout(
        mobileLayout: (context) => const HospitalMobileLayout(),
        tabletLayout: (context) => const HospitalTabletLayout() ,
        desktopLayout: (context) => const HospitalDesktopLayout(),
      ),
    );
  }
}
