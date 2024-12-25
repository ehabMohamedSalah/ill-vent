



import 'package:flutter/material.dart';

import '../../../../core/utils/colors_manager.dart';
import '../../../../core/utils/shared/adaptive_layout/adaptive_layout.dart';
import '../../../../core/utils/size_config.dart';
import 'layouts/PhotoDesktopLayout.dart';
import 'layouts/PhotoMobileLayout.dart';
import 'layouts/PhotoTabletLayout.dart';

class PhotoScreen extends StatelessWidget {
  PhotoScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor:   ColorManager.primaryColor,

      body: AdaptiveLayout(
        mobileLayout: (context) =>   PhotoMobileLayout(),
        tabletLayout: (context) => const PhotoTabletLayout() ,
        desktopLayout: (context) => const PhotoDesktopLayout(),
      ),
    );

  }
}
