import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ill_vent/core/resuable_component/custom_drawer/widget/driver.dart';
import 'package:ill_vent/core/resuable_component/custom_drawer/widget/drop_down_button.dart';
import 'package:ill_vent/core/resuable_component/custom_drawer/widget/item.dart';
import 'package:ill_vent/core/resuable_component/custom_drawer/widget/logo_widget.dart';
 import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';
import 'package:ill_vent/core/utils/routes_manager.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    double width=MediaQuery.sizeOf(context).width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * .7,
            color: const  Color(0xff0C6980),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LogoWidget(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ehab Salah",style: Appstyle.large30(context),),
                      Text("Ehabsalah52t@gmail.com",style: Appstyle.VerySmall15(context),),

                      Driver(),
                      RowItem(Image:"assets/images/4_drawer/profile.svg" ,text: "Profile",onTap: (){}),
                      SizedBox(height: 20,),
                      RowItem(Image:"assets/images/4_drawer/notification-active.svg" ,text: "Notification Center",onTap: (){}),


                      Driver(),
                      DropdownButtonWidget(),
                      Driver(),

                      RowItem(Image:"assets/images/4_drawer/history.svg" ,text: "History",onTap: (){},),

                      Driver(),

                      RowItem(Image:"assets/images/4_drawer/medical.svg" ,text: "Medical",onTap: (){}),
                      SizedBox(height: 20,),
                      RowItem(Image:"assets/images/4_drawer/setting-filled.svg" ,text: "Settings",onTap: (){},),
                      SizedBox(height: 20,),
                      RowItem(Image:"assets/images/4_drawer/about.svg" ,text: "About Us",onTap: (){},),
                      Driver(),

                      RowItem(Image:"assets/images/4_drawer/log-out.svg" ,text: "Log Out",
                        onTap: (){Navigator.pushNamed(context, RouteManager.loginRoutes);
                        },),




                    ],
                  ),
                )
          
          
          
              ],
            ),
          ),
        ],
      ),
    );
  }
}