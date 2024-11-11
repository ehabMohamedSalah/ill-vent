import 'package:flutter/material.dart';
 import 'package:ill_vent/core/utils/size_config.dart';
 import '../../../../core/utils/colors_manager.dart';
import '../../../../core/utils/shared/adaptive_layout/adaptive_layout.dart';
import 'layouts/shop_desktop_layout.dart';
import 'layouts/shop_mobile_layout.dart';
import 'layouts/shop_tablet_layout.dart';
class ShopScreen extends StatelessWidget {
  ShopScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor:   ColorManager.primaryColor,
      body: AdaptiveLayout(
        mobileLayout: (context) => const ShopMobileLayout(),
        tabletLayout: (context) => const ShopTabletLayout() ,
        desktopLayout: (context) => const ShopDesktopLayout(),
      ),
    );
  }
}
