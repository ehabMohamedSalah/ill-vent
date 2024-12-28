import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
 import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';

import '../../../../Domain/entity/dr_entity.dart';

class HorItemWidget1 extends StatelessWidget {
  DrEntity entity;
  HorItemWidget1({required this.entity});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    double height=MediaQuery.sizeOf(context).height;

    return Container(
      width: width*0.4,
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
              child: CachedNetworkImage(
                imageUrl: entity.thumbnail??"",width: width*0.34,height: width*0.2,fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),

             Expanded(
                flex: 1,
                child: Text(
                "  ${entity.name}",style: Appstyle.small15(context), maxLines: 1,)),
            Expanded(
              flex: 2,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) => Text(
                  "${entity.deals?.dealName}", // عرض أسماء العروض مفصولة بفواصل
                  style: Appstyle.small15(context).copyWith(
                    color: Colors.yellow,
                  ),
                  maxLines: 2,
                ) ,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
