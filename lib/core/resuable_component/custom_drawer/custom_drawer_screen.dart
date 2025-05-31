import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:ill_vent/core/constant.dart';
import 'package:ill_vent/core/resuable_component/custom_drawer/widget/driver.dart';
import 'package:ill_vent/core/resuable_component/custom_drawer/widget/item.dart';
import 'package:ill_vent/core/resuable_component/custom_drawer/widget/logo_widget.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';
import 'package:ill_vent/core/utils/routes_manager.dart';
import '../../cache/shared_pref.dart';
import '../../di/di.dart';


class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String? userName;
  String? email;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    // افترضت انك بتستخدم CacheHelper مثلاً مع دالة getData
    final cacheHelper = getIt<CacheHelper>();

    final storedName = await cacheHelper.getData<String>(Constant.nameKey);
    final storedEmail = await cacheHelper.getData<String>(Constant.emailKey);

    setState(() {
      userName = storedName ?? "User Name";
      email = storedEmail ?? "user@example.com";
    });
  }

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    double width=MediaQuery.sizeOf(context).width;
    return Container(
      width: width * .7,
      color: ColorManager.secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LogoWidget(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userName ?? "Loading...", style: Appstyle.large30(context)),
                Text(email ?? "", style: Appstyle.VerySmall15(context)),

                Driver(),
               /* RowItem(Image:"assets/images/4_drawer/profile.svg" ,text: "Profile",onTap: (){}),
                SizedBox(height: 20,),
                RowItem(Image:"assets/images/4_drawer/notification-active.svg" ,text: "Notification Center",onTap: (){}),*/
              /*  Driver(),
                DropdownButtonWidget(),
                Driver(),
    */
              /*  RowItem(Image:"assets/images/4_drawer/history.svg" ,text: "History",onTap: (){},),

                Driver(),*/

                RowItem(
                    Image:"assets/images/4_drawer/medical.svg" ,
                    text: "Medical",onTap: (){
                            Navigator.pushNamed(context, RouteManager.medicalHistoryScreen);
                }),
                SizedBox(height: 20,),
             /*   SizedBox(height: 20,),
                RowItem(Image:"assets/images/4_drawer/setting-filled.svg" ,text: "Settings",onTap: (){},),
                SizedBox(height: 20,),
                RowItem(Image:"assets/images/4_drawer/about.svg" ,text: "About Us",onTap: (){},),
                Driver(),*/

                RowItem(Image:"assets/images/4_drawer/log-out.svg" ,text: "Log Out",
                  onTap: (){
                    Navigator.pushNamed(context, RouteManager.authScreen);
                  },),
              ],
            ),
          )
        ],
      ),
    );
  }
}
