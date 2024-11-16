import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    double width=MediaQuery.sizeOf(context).width;
    return Stack(
      children: [
        Container(
          height:height*0.3 ,
          width: double.infinity,
          color: Colors.transparent,
        ),
        Container(
            color: Colors.blue,
            height:height*0.25,
            width: double.infinity,
            child: Image.asset('assets/images/4_drawer/ill-vent .png', height:height*0.25,)),

        Positioned(
          bottom:  0,
          left: 20,
          child: ClipRRect(

            borderRadius: BorderRadius.circular(100),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width:4,
                      style:BorderStyle.solid ,

                      color: Colors.transparent, // Make the border color transparent to reveal gradient
                    ),
                    borderRadius: BorderRadius.circular(100),

                    gradient: LinearGradient(
                      colors: [Color(0xfff008F7A), Color(0xff845EC2)], // Two colors for the border
                    )),
                child: Image.asset('assets/images/4_drawer/me.png',fit:BoxFit.cover ,height: height*0.08,width: height*0.08,)),

          ),
        ),
        SizedBox(height: 10,),

      ],
    );
  }
}
