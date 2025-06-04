import 'package:flutter/material.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';

class CustomHomeTextfield extends StatelessWidget {
  bool obscureText;
  TextInputType? keyboardType;
  String? Function(String?)? validator;
  String hintText;
  String labelText;
  Widget? suffixIcon;
  TextEditingController? controller;
  CustomHomeTextfield({  this.obscureText=false,this.keyboardType= TextInputType.text,required this.validator,required this.hintText,required this.labelText,this.suffixIcon,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.symmetric(horizontal: 20,),
      child: TextFormField(
        keyboardType:keyboardType,
        obscureText: obscureText,
      validator: validator,
      cursorColor: ColorManager.secondaryColor,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon:suffixIcon,
        hintText:hintText ,
        labelText: labelText,
        labelStyle: Appstyle.small15(context).copyWith(color: ColorManager.secondaryColor),
        hintStyle: Appstyle.small15(context).copyWith(color: ColorManager.secondaryColor),
        disabledBorder:  OutlineInputBorder(
            borderRadius:BorderRadius.circular(20),
            borderSide: BorderSide(
              color: ColorManager.secondaryColor,
              width: 2,
            )
        ),
        focusedBorder:  OutlineInputBorder(
            borderRadius:BorderRadius.circular(20),
            borderSide: BorderSide(
              color: ColorManager.secondaryColor,
              width: 2,
            )
        ),
        border: OutlineInputBorder(
      borderRadius:BorderRadius.circular(20),
      borderSide: BorderSide(
        color: ColorManager.secondaryColor,
        width: 2,
      )
        )
      ),
      ),
    );
  }
}
