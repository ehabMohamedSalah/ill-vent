import 'package:flutter/material.dart';

import '../../../../core/utils/Appstyle.dart';
import '../../../../core/utils/colors_manager.dart';
import '../../../../core/utils/strings_manager.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Padding(
      padding:   EdgeInsets.only(left: height*0.04),
      child: Container(

          decoration: BoxDecoration(
              color: ColorManager.primaryColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight:Radius.circular(30) )
          ),
          child: Padding(
            padding:   EdgeInsets.only(bottom: 2,left: 30,right: 30),
            child: Text(StringsManager.register,style: Appstyle.medium25(context),),
          )),
    );
  }
}
