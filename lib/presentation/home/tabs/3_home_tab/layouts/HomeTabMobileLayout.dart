 import 'package:flutter/material.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/core/utils/routes_manager.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/resuable_component/LottieWidget.dart';

class HomeTabMobileLayout extends StatelessWidget {
  const HomeTabMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    double width=MediaQuery.sizeOf(context).width;

    return Column(
      children: [
        LottieWidget(Animation: 'assets/images/lottie/hospital.json' ,StaticImage: 'assets/images/lottie/hospital_image.png',),
        Stack(
          alignment: Alignment.center,
          children: [
            Text('Click Here' ,style: Appstyle.small20(context) ),
            IconButton(
                onPressed:(){
                  Navigator.pushNamed(context, RouteManager.scanScreen);
                } ,
                icon: Icon(Icons.local_hospital,color: Colors.white,size: height*0.31,),
            ),
          ],
        ),


      ],
    );
  }
}
