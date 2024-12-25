
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ill_vent/Domain/entity/dr_entity.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';

import '../../../../data_layer/model/widget_model.dart';

class VerItemWidget1 extends StatelessWidget {
  DrEntity model;
  VerItemWidget1({required this.model});
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
              child: CachedNetworkImage(
                imageUrl: model.thumbnail??"",height:  height*0.16,fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
             SizedBox(width: 10,),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                      "  ${model.name??""} ",style: Appstyle.small15(context),maxLines: 1,)),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(model.description??"",style: Appstyle.small15(context),maxLines: 2,)),

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
