import 'package:flutter/material.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';

import '../utils/Appstyle.dart';

class CustomFormField extends StatelessWidget {
  String title;
  String hintText;
  TextInputType keyboard;
  TextEditingController controller;
  String? Function(String?)? validator;
  int maxLength;
  bool obsecureText;
  bool filledColor;
  Widget? suffixIcon;
  CustomFormField({super.key,required this.title,required this.hintText,required this.keyboard,required this.controller,required this.validator,required this.maxLength,  this.obsecureText=false,this.filledColor=false,this.suffixIcon});


  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
       height: height*0.12,
       child: TextFormField(

        cursorColor: Colors.white,
        keyboardType:keyboard ,
        validator: validator,
        controller: controller,
        maxLength:maxLength ,
        obscureText: obsecureText,
      style:Appstyle.smallLabelText(context).copyWith(color: Colors.white) ,
        decoration: InputDecoration(
          fillColor: filledColor?ColorManager.primaryColor:Colors.transparent,
          suffixIcon: suffixIcon,
          filled: true,
          label:  Text(title,style: Appstyle.smallLabelText(context).copyWith(color: Colors.white)),
          hintText:hintText ,

          hintStyle: Appstyle.smallLabelText(context).copyWith(color: Colors.white),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black,width: 2,style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder:OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black,width: 2,style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black,width: 2,style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10),
          ),
          disabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black,width: 2,style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
