import 'package:flutter/material.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';

import '../utils/colors_manager.dart';
import '../utils/strings_manager.dart';

class SignButton extends StatelessWidget {
  String text;
  Color TextColor;
  Color borderColor;
  //Color backGroundColor;
  bool linearGradient;
  Color backgroundColor;
  void Function()? onTap;
  SignButton({super.key,required this.text,required this.TextColor,required this.borderColor,required this.linearGradient,  this.backgroundColor = ColorManager.headlineColor,
  required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    double width=MediaQuery.sizeOf(context).width;
    return  InkWell(
      onTap:onTap ,
      child: Container(
          width: double.infinity,
          height: height*0.08,
           decoration: BoxDecoration(
            gradient: linearGradient?LinearGradient(
              colors: [
                Color(0xFFFAB2FF), // Light pink color
                Color(0xFF1904E5), // Dark blue color
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ):LinearGradient(
                colors: [
                  backgroundColor,
                  backgroundColor,
                ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,),
            border: Border.all(color: borderColor),
            borderRadius:BorderRadius.circular(25),color:ColorManager.primaryColor,
          ),
          child: Center(
            child: Text(text,style: Appstyle.large30(context).copyWith(color: TextColor,)),
          )),
    );

  }
}
