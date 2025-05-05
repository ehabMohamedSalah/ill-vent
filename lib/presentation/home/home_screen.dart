import 'package:flutter/material.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/presentation/home/home_layout/home_desktop_layout.dart';
import 'package:ill_vent/presentation/home/home_layout/home_mobile_layout.dart';

import '../../core/resuable_component/custom_drawer/custom_drawer_screen.dart';
import '../../core/utils/colors_manager.dart';
import '../../core/utils/shared/adaptive_layout/adaptive_layout.dart';
import '../../core/utils/size_config.dart';
import '../../core/utils/strings_manager.dart';
import 'home_layout/home_tablet_layout.dart';

class HomeScreen extends StatelessWidget {
    HomeScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(

      key: scaffoldKey,
      appBar: MediaQuery.sizeOf(context).width < SizeConfig.tablet
          ? AppBar(
        elevation: 0,

        backgroundColor:   ColorManager.secondaryColor,
        leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu,color: Colors.white,size:37 ,)),
        title: Text(StringsManager.illVent,style: Appstyle.large30(context),),
        actions: [

          Image.asset('assets/images/4_drawer/ill-vent .png' ,color: Colors.black,),
        ],
      ) : null,
       drawer: MediaQuery.sizeOf(context).width < SizeConfig.tablet
          ? const CustomDrawer()
          : null,

      body: Stack(
        children: [
           HomeMobileLayout(),

        ],
      ),

    );

  }
}
