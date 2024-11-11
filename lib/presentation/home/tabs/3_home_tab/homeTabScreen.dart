import 'package:flutter/material.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/core/utils/size_config.dart';
import 'package:ill_vent/presentation/home/home_layout/home_desktop_layout.dart';
import 'package:ill_vent/presentation/home/home_layout/home_mobile_layout.dart';
import 'package:ill_vent/presentation/home/home_layout/home_tablet_layout.dart';
import 'package:ill_vent/presentation/home/tabs/3_home_tab/layouts/HomeTabTabletLayout.dart';

import '../../../../core/utils/colors_manager.dart';
import '../../../../core/utils/shared/adaptive_layout/adaptive_layout.dart';
import 'layouts/HomeTabDesktopLayout.dart';
import 'layouts/HomeTabMobileLayout.dart';



class HomeTabScreen extends StatelessWidget {
  HomeTabScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      key: scaffoldKey,


      backgroundColor:   ColorManager.primaryColor,


      body: AdaptiveLayout(
        mobileLayout: (context) => const HomeTabMobileLayout(),
        tabletLayout: (context) => const HomeTabTabletLayout() ,
        desktopLayout: (context) => const HomeTabDesktopLayout(),
      ),
    );

  }
}
