import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';

class RowItem extends StatelessWidget {
  String Image;
  String text;
  VoidCallback onTap;
  RowItem({required this.Image,required this.text,  required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
         SvgPicture.asset(Image,width: 30,height: 30,),
          SizedBox(width: 10,),
          Text(text,style: Appstyle.small15(context),),
        ],
      ),
    );
  }
}
