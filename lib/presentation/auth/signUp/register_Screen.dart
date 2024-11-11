import 'package:flutter/material.dart';
import 'package:ill_vent/presentation/auth/signUp/layouts/desktop_layout.dart';
import 'package:ill_vent/presentation/auth/signUp/layouts/tablet_layout.dart';

import '../../../core/utils/colors_manager.dart';
import '../../../core/utils/shared/adaptive_layout/adaptive_layout.dart';
import '../../../core/utils/size_config.dart';
import 'layouts/mobile_layout.dart';

class SignUp extends StatelessWidget {
    SignUp({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      key: scaffoldKey,
      //appBar: MediaQuery.sizeOf(context).width < SizeConfig.tablet ? AppBar() : null,
      backgroundColor:   ColorManager.primaryColor,

      body: AdaptiveLayout(
        mobileLayout: (context) => const RegisterMobileLayout(),
        tabletLayout: (context) => const RegisterTabletLayout(),
        desktopLayout: (context) => const RegisterDesktopLayout(),
      ),
    );

  }

}
