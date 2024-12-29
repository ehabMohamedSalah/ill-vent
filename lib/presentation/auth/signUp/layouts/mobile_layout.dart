import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:ill_vent/core/resuable_component/sign_buttom.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';
import 'package:ill_vent/core/utils/routes_manager.dart';

import '../../../../core/resuable_component/LoginCustomFormField.dart';
import '../../../../core/resuable_component/RegisterCustomField.dart';
import '../../../../core/utils/constants/constant.dart';
import '../../../../core/utils/strings_manager.dart';
import '../widgets/register_Widget.dart';

class RegisterMobileLayout extends StatefulWidget {
  const RegisterMobileLayout({super.key});

  @override
  State<RegisterMobileLayout> createState() => _RegisterMobileLayoutState();
}

class _RegisterMobileLayoutState extends State<RegisterMobileLayout> {

  bool isConfirmObsecure=true;
  bool isObsecure=true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController genderController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController rePasswordController;
  late TextEditingController birthYearController;
  late TextEditingController birthMonthController;
  late TextEditingController birthDayController;
  late TextEditingController AgeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstNameController=TextEditingController();
    lastNameController=TextEditingController();
    genderController=TextEditingController();
    emailController=TextEditingController();
    passwordController=TextEditingController();
    rePasswordController=TextEditingController();
    birthYearController=TextEditingController();
    birthMonthController=TextEditingController();
    birthDayController=TextEditingController();
    AgeController=TextEditingController();


  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    firstNameController.dispose;
    lastNameController.dispose;
    genderController.dispose;
    emailController.dispose;
    passwordController.dispose;
    rePasswordController.dispose;
    birthYearController.dispose;
    birthMonthController.dispose;
    birthDayController.dispose;
    AgeController.dispose;
  }
  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    var w=height-height*0.28;

    return Form(
      key: formKey,
      child: Column(
        children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding:   EdgeInsets.only(right: height*0.01,left:height*0.01,top: height*0.14 ,bottom: 0.14),
                    child: Stack(
                      children: [
                            InkWell(
                                onTap: () => Navigator.pop(context),
                                child: Icon(Icons.arrow_back,color: Colors.white,)),
                        Container(
                          width: double.infinity,
                          height: w,
                          decoration: BoxDecoration(
                            color: ColorManager.headlineColor,
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Padding(
                            padding:   EdgeInsets.only(top: height*0.15,bottom:height*0.07,right: height*0.01,left: height*0.01 ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: RegisterCustomFormField(title: StringsManager.firstName, hintText: StringsManager.fNameHint, keyboard: TextInputType.text, controller: firstNameController, maxLength: 30,
                                          validator:(value){
                                              if(value==null||value.isEmpty){
                                              return StringsManager.notValidName;
                                              }}

                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    Expanded(
                                      child: RegisterCustomFormField(title: StringsManager.lastName, hintText:  StringsManager.lNameHint , keyboard: TextInputType.text, controller: lastNameController, maxLength: 30,
                                          validator:(value){
                                            if(value==null||value.isEmpty){
                                              return StringsManager.notValidName;
                                            }}

                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 7,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: RegisterCustomFormField(title: StringsManager.gender, hintText:  StringsManager.genderHint, keyboard: TextInputType.text, controller: genderController, maxLength: 30,
                                          validator:(value){
                                       String valuee=value!.toLowerCase();
                                            if(valuee!="male"||valuee!="female"){
                                              return StringsManager.noValidGender;}
                                          }

                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    Expanded(
                                      flex: 2,
                                      child: RegisterCustomFormField(title: StringsManager.emailAddress, hintText:  StringsManager.emailHint, keyboard: TextInputType.emailAddress, controller: emailController, maxLength: 30,
                                              validator: (value) {
                                                if (!Constant.regexEmail.hasMatch(
                                                    value ?? "")) {
                                                  return StringsManager
                                                      .notValidEmail;
                                                }
                                              }
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 7,),
                                RegisterCustomFormField(
                                  keyboard:TextInputType.visiblePassword ,
                                  obsecureText: isObsecure,
                                  suffixIcon:IconButton( onPressed:(){
                                    setState(() {
                                      isObsecure=!isObsecure;
                                    });
                                  } ,
                                      icon:Icon(
                                        isObsecure? Icons.visibility_off:Icons.visibility,
                                        size: 24,
                                        color: Colors.white,
                                      ) ) ,
                                  validator: (value){
                                    if(value==null||value.isEmpty){
                                      return StringsManager.notValidName;
                                    }
                                    if(value.length<8){
                                      return StringsManager.notValidPassword;
                                    }
                                    return null;
                                  },
                                  controller:passwordController ,
                                  title: 'Password', hintText:  StringsManager.passHint, maxLength: 0,
                                ),
                                SizedBox(height: 7,),
                                RegisterCustomFormField(
                                  keyboard:TextInputType.visiblePassword ,
                                  obsecureText: isObsecure,
                                  suffixIcon:IconButton( onPressed:(){
                                    setState(() {
                                      isObsecure=!isObsecure;
                                    });
                                  } ,
                                      icon:Icon(
                                        isObsecure? Icons.visibility_off:Icons.visibility,
                                        size: 24,
                                        color: Colors.white,
                                      ) ) ,
                                  validator: (value){
                                    if(value != passwordController.text ||value==null||value.isEmpty){
                                      return StringsManager.notValidRepassword ;
                                    }
                                    return null;
                                  },
                                  controller:rePasswordController ,
                                  title: 'Re-enter your password', hintText: StringsManager.rePassHint, maxLength: 0,
                                ),
                                SizedBox(height: 7,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: RegisterCustomFormField(title: StringsManager.birthY, hintText:StringsManager.birthYHint, keyboard: TextInputType.datetime, controller: birthYearController, maxLength: 30,
                                          validator:(value){
                                            if(value!.length!=4){
                                              return  StringsManager.notValidByear;}
                                          }

                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    Expanded(
                                      child: RegisterCustomFormField(title: StringsManager.birthM, hintText: "4 ", keyboard: TextInputType.datetime, controller: birthMonthController, maxLength: 30,
                                          validator:(value){
                                            if(value!.length<1){
                                              return StringsManager.notValidBmonth;
                                            }
                                          }

                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    Expanded(
                                      child: RegisterCustomFormField(title: StringsManager.birthD, hintText: StringsManager.birthDHint, keyboard: TextInputType.datetime, controller: birthDayController, maxLength: 30,
                                          validator:(value){
                                            if(value!.length<1){
                                              return StringsManager.notValidBday;
                                            }
                                          }

                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    Expanded(
                                      child: RegisterCustomFormField(title: StringsManager.age, hintText: StringsManager.ageHint, keyboard: TextInputType.datetime, controller: AgeController, maxLength: 30,
                                          validator:(value){
                                            if(value!.length<2 ){
                                              return StringsManager.notValidAge;
                                            }
                                          }

                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                InkWell(
                                    onTap: () {
                                          if(formKey.currentState?.validate()??false){
                                            Navigator.pushNamed(context, RouteManager.loginRoutes,);

                                          }

                                    },
                                    child: SignButton(text:StringsManager.signUP ,TextColor: ColorManager.white,borderColor:Colors.transparent   ,linearGradient: true,onTap: (){},)),
                              ],
                            ),
                          ),
                        ),
                        RegisterWidget(),

                      ],
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
// if(formKey.currentState?.validate()??false){}