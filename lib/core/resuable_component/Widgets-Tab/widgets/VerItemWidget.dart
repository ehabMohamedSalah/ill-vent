
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';

import '../../../../data_layer/model/widget_model.dart';

class VerItemWidget extends StatelessWidget {
  WidgetModel model;
  VerItemWidget({required this.model});
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    double width=MediaQuery.sizeOf(context).width;

    return Container(
      height: height*0.16,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.black,
          width: 4,
          style: BorderStyle.solid,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Image.asset(model.image,fit: BoxFit.fill ,height: height*0.16,)),
            SizedBox(width: 10,),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(model.title,style: Appstyle.small15(context),maxLines: 1,)),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(model.desc,style: Appstyle.small15(context),maxLines: 2,)),

                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios,size: 30,color: Colors.white,),
            ],
        ),
      ),
    );
  }
}
