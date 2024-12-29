import 'package:flutter/material.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';
import 'package:ill_vent/presentation/auth/signIn/layouts/desktop_layout.dart';
import 'package:ill_vent/presentation/auth/signIn/layouts/tablet_layout.dart';

import '../../../core/utils/shared/adaptive_layout/adaptive_layout.dart';
import '../../../core/utils/size_config.dart';
import 'layouts/mobile_layout.dart';

class LoginScreen2 extends StatefulWidget {

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext coxntext) {
    SizeConfig.init(context);
    return Scaffold(
      key: scaffoldKey,
      //appBar: MediaQuery.sizeOf(context).width < SizeConfig.tablet ? AppBar() : null,
      backgroundColor:   ColorManager.primaryColor,

      body: AdaptiveLayout(
        mobileLayout: (context) => const LoginMobileLayout(),
        tabletLayout: (context) => const LoginTabletLayout(),
        desktopLayout: (context) => const LoginDesktopLayout(),
      ),
    );

  }
}
