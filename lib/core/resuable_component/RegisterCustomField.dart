import 'package:flutter/material.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';

import '../utils/Appstyle.dart';

class RegisterCustomFormField extends StatelessWidget {
  String title;
  String hintText;
  TextInputType keyboard;
  TextEditingController controller;
  String? Function(String?)? validator;
  int maxLength;
  bool obsecureText;
  bool filledColor;
  Widget? suffixIcon;
  RegisterCustomFormField({super.key,this.obsecureText=false,this.suffixIcon,required this.title,required this.hintText,required this.keyboard,required this.controller,required this.validator,required this.maxLength,   this.filledColor=false});


  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;

    return TextFormField(

      cursorColor: Colors.white,
      keyboardType:keyboard ,
      validator: validator,
      controller: controller,

      obscureText: obsecureText,
      decoration: InputDecoration(
        fillColor: ColorManager.secondaryColor,
        suffixIcon:suffixIcon,

        filled: true,
        label:  Text(title,style: Appstyle.labelRegisterStyle(context)),
        hintText:hintText ,
        hintStyle: Appstyle.labelRegisterStyle(context).copyWith(color: Colors.black),hintMaxLines: 1,
        border: OutlineInputBorder(
         ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color:ColorManager.headlineColor ),
        ),
        focusedBorder:    OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        disabledBorder:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
