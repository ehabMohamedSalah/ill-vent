import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';

import '../../../../../core/resuable_component/RegisterCustomField.dart';

class ScanWidget extends StatelessWidget {
  const ScanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    double width=MediaQuery.sizeOf(context).width;
    return  Column(
      children: [
        Container(
            decoration: BoxDecoration(
                color: ColorManager.headlineColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft:Radius.circular(20) ),
            ),
            child: Padding(
              padding:   EdgeInsets.only(right: 20,left: 20,top: 10),
              child: SvgPicture.asset("assets/images/3_home&bottoms/afterScan/Ambulance.svg"),
            )),
        Container(
          decoration: BoxDecoration(
              color: ColorManager.headlineColor,
              borderRadius: BorderRadius.circular(40)
          ),

          child: Padding(
            padding:   EdgeInsets.only(top: 40,left: 40,right: 40,bottom: 10),
            child: Column(
              children: [
                
                SizedBox(height: height*0.01,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(40)
                  ),
                    child: Icon(Icons.qr_code_2_sharp,size: height*0.32,)),
                Text('Scan Patient Code',style: Appstyle.medium25(context),),
              ],
            ),
          ),
        ),
        SizedBox(height: 29,),


      ],
    );
  }
}
