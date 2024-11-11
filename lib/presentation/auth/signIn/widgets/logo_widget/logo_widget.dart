import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/utils/Appstyle.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;

    return Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight:  Radius.circular(10)),
            child: Image.asset("assets/images/2_login&SignUp/ill-vent 1.png",width: double.infinity,height: height*0.33,fit: BoxFit.fill,)),
        Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.blue
            ),
            child: Center(child: Text("ill-vent registeration",style:Appstyle.medium25(context),))),
      ],
    );
  }
}
