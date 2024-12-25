import 'package:flutter/material.dart';

import '../utils/Appstyle.dart';
import '../utils/colors_manager.dart';
import '../utils/routes_manager.dart';

class CustomAppBar extends StatelessWidget  implements PreferredSizeWidget{
 String navigatorScreen;
 CustomAppBar({required this.navigatorScreen});

  @override
  Widget build(BuildContext context) {
    return   AppBar(
      backgroundColor: ColorManager.secondaryColor,
      title: Text('Emergency Rescue',style: Appstyle.medium25(context),),
      leading: IconButton(color: Colors.white, onPressed: () {
        Navigator.pushNamed(context, navigatorScreen);
      }, icon: Icon(Icons.arrow_back_ios_new,size: 30),),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);}
