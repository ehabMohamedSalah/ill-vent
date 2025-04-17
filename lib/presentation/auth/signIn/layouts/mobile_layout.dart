 import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:ill_vent/config/theme/appTheme.dart';
import 'package:ill_vent/core/resuable_component/sign_buttom.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';
import 'package:ill_vent/core/utils/routes_manager.dart';

import '../../../../core/constant.dart';
import '../../../../core/resuable_component/LoginCustomFormField.dart';
 import '../../../../core/utils/strings_manager.dart';
import '../widgets/logo_widget/logo_widget.dart';

class LoginMobileLayout extends StatefulWidget {
  const LoginMobileLayout({super.key});

  @override
  State<LoginMobileLayout> createState() => _LoginMobileLayoutState();
}

class _LoginMobileLayoutState extends State<LoginMobileLayout> {


  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isObsecure=true;
  late TextEditingController emailContrller;
  late TextEditingController passwordContrller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailContrller=TextEditingController();
    passwordContrller=TextEditingController();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailContrller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Padding(
      padding:   EdgeInsets.only(left: 15,right: 15,bottom: 16,top: 20),
      child: Form(
        key: formKey,
        child: CustomScrollView(
          slivers: [
             SliverToBoxAdapter(
               child: SizedBox(height: height*0.06,),
             ),
            SliverToBoxAdapter(child: LogoWidget()),
            SliverToBoxAdapter(child: SizedBox(height:21 ,)),
            SliverToBoxAdapter(
              child: CustomFormField( maxLength: 50,title: StringsManager.email,controller: emailContrller,hintText: StringsManager.enterYourEmail,keyboard:TextInputType.emailAddress ,
                validator: (value){
                  if (!RegExp(Constant.regExValidateEmail).hasMatch(value ?? "")) {
                    return StringsManager.notValidEmail;
                  }
                },),
            ),
            SliverToBoxAdapter(
              child: CustomFormField( maxLength: 50,title: StringsManager.password,controller: passwordContrller,hintText: "",keyboard:TextInputType.visiblePassword ,
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
                  if(value!.length < 8){
                    return StringsManager.notValidPassword;
                  }
                },),
            ),
            SliverToBoxAdapter(child: SizedBox(height: height*0.01,),),

            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: (){
                        if(formKey.currentState?.validate()??false){
                          Navigator.pushNamed(context, RouteManager.homeScreenRoutes,);
                        }
                      },
                      child: SignButton(text: StringsManager.lOGIN,TextColor: ColorManager.black,borderColor: Colors.blue, linearGradient: false,onTap: (){},)),
                  SizedBox(width: 0,),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RouteManager.signUpRoutes,);

                      },
                      child: SignButton(text:StringsManager.signUP ,TextColor: ColorManager.white,borderColor:Colors.transparent   ,linearGradient: true,onTap: (){},)),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 18,)),
            SliverToBoxAdapter(
              child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RouteManager.homeScreenRoutes,);
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(StringsManager.quickRescue,style: Appstyle.small20(context).copyWith(color: Colors.white)
                    ),
                  ) ,)),


          ],
        ),
      ),
    );
  }
}
// if(formKey.currentState?.validate()??false){}