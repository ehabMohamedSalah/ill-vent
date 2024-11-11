import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
 import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';

class HorItemWidget extends StatelessWidget {
  String title;
  String desc;
  HorItemWidget({required this.title,required this.desc});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    double height=MediaQuery.sizeOf(context).height;

    return Container(
        width: width*0.35,
      height: width*3,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black,width: 4,style: BorderStyle.solid)
      ),
      child: Padding(
        padding:   EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
            Expanded(
                flex: 5,
                child: Image.asset('assets/images/3_home&bottoms/Rectangle.png',width: width*0.34,height: width*0.2,fit: BoxFit.fill,)),
            Expanded(
                flex: 1,
                child: Text(title,style: Appstyle.small15(context), maxLines: 1,)),
            Expanded(
                flex: 1,
                child: Text(desc,style: Appstyle.small15(context),maxLines: 1, )),
                    ],
        ),
      ),
    );
  }
}
