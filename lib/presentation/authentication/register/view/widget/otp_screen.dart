import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resuable_component/sign_buttom.dart';
import '../../../../../core/utils/Appstyle.dart';
import '../../../../../core/utils/colors_manager.dart';
import '../../../../../core/utils/routes_manager.dart';
import '../../../../../core/utils/strings_manager.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      backgroundColor: ColorManager.primaryColor,
      body: Form(

        child: Column(
          children: [
            SizedBox(
                height:height * 0.35,
                width: double.infinity,
                child: Image.asset("assets/images/auth/login&email.png")),
            Expanded(
              child: Container(

                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color:  ColorManager.secondaryColor,
                  ),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40) ),
                  color: ColorManager.secondaryColor,
                ),
                child: SingleChildScrollView(

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: 30,),
                        Align(
                            alignment: Alignment.center,
                            child: Text("Enter Authentication\nCode to finish",style: Appstyle.medium25(context),)),
                        OtpTextField(
                          numberOfFields: 6,
                          borderColor: Colors.grey, // لون الحدود العادي
                          fillColor: Colors.white, // لون الخلفية داخل الحقول
                          enabledBorderColor: Colors.blue, // لون الحدود عند التفعيل
                          disabledBorderColor: Colors.grey.shade400, // لون الحدود عند التعطيل
                          filled: true,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          fieldWidth: 52,
                          fieldHeight: 52,
                          borderWidth: 2,
                          mainAxisAlignment: MainAxisAlignment.center,
                          margin: EdgeInsets.symmetric(vertical: 24, horizontal: 5.5),
                          showFieldAsBox: true,
                          onSubmit: (String verificationCode) {
                            //VerificationViewModelCubit.get(context).Verify(resetCode: verificationCode.toString());
                          },
                        ),
                         Align(
                            alignment: Alignment.center,
                            child: Text("A message will be sent to your e-mail\nplease fill the 6 numbers to make sure its you",style: Appstyle.small15(context),)),
                        SizedBox(height: 30,),
                        Align(
                            alignment: Alignment.center,
                            child: Text("Message not sent?",style: Appstyle.small15(context),)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: Colors.white,size: 50)),
                          Align(
                              alignment: Alignment.center,
                              child: Text("Resend-send Code",style: Appstyle.small15(context).copyWith(color: Colors.white70,decoration: TextDecoration.underline),)),
                          IconButton(onPressed: (){
                            Navigator.pushNamed(context, RouteManager.homeScreenRoutes);
                          }, icon: Icon(Icons.arrow_forward,color: Colors.white,size: 50,)),

                        ],)

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
}
