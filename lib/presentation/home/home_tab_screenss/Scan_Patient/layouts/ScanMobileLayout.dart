
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';
import 'package:ill_vent/core/utils/routes_manager.dart';

import '../../../../../core/resuable_component/LoginCustomFormField.dart';
import '../../../../../core/resuable_component/RegisterCustomField.dart';
import '../../../../../core/resuable_component/id_CustomField.dart';
import '../../../../../core/resuable_component/resuable_AppBar.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../tabs/3_home_tab/Widgets/scan_widget.dart';

class ScanMobileLayout extends StatefulWidget {
  const ScanMobileLayout({super.key});

  @override
  State<ScanMobileLayout> createState() => _ScanMobileLayoutState();
}

class _ScanMobileLayoutState extends State<ScanMobileLayout> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

   late TextEditingController ID;

  @override
  void initState() {
  // TODO: implement initState
  super.initState();
  ID=TextEditingController();

  }
  @override
  void dispose() {
  // TODO: implement dispose
  super.dispose();
   }

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    double width=MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      appBar: CustomAppBar(navigatorScreen: RouteManager.homeScreenRoutes ,),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: height*0.04,),
            Stack(
              children: [
                Center(child: ScanWidget()),
              ],
            ),
            Text('Scan to continue',style: Appstyle.small20(context),),
            Text('-OR-',style: Appstyle.small20(context),),
            SizedBox(height: 29,),
            IdCustomFormField(controller: ID,hintText: 'Type Patient ID...',title: '',keyboard: TextInputType.text,maxLength: 30,validator: (value){},),
        
            InkWell(
              onTap: (){
                    Navigator.pushNamed(context, RouteManager.photoScreen);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Next',style: Appstyle.small15(context),),
                  Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20,),
                  SizedBox(width: 10,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
