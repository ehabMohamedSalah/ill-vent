import 'package:flutter/material.dart';
import '../../../../core/utils/colors_manager.dart';
import '../../../../core/utils/shared/adaptive_layout/adaptive_layout.dart';
import '../../../../core/utils/size_config.dart';
import 'layouts/ScanDesktopLayout.dart';
import 'layouts/ScanMobileLayout.dart';
import 'layouts/ScanTabletLayout.dart';

class ScanScreen extends StatelessWidget {
  ScanScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor:   ColorManager.primaryColor,
      body: AdaptiveLayout(
        mobileLayout: (context) => const ScanMobileLayout(),
        tabletLayout: (context) => const ScanTabletLayout() ,
        desktopLayout: (context) => const ScanDesktopLayout(),
      ),
    );

  }
}
