import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ill_vent/Domain/entity/dr_entity.dart';
import 'package:ill_vent/core/resuable_component/Widgets-Tab/widgets/horz-itemWidget.dart';
import 'package:ill_vent/core/resuable_component/Widgets-Tab/widgets/horz_itemWidget1.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';

class TabHorzItem1 extends StatelessWidget {
  List<DrEntity>modelList;

  TabHorzItem1(this.modelList);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Expanded(
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder:  (context, index) {
                DrEntity entity = modelList[index];
                if (entity.deals != null) {
                  return HorItemWidget1(entity: entity);
                }   else if(entity.deals == 0) {
                  return Text("Currently, no deals are available.");
                }
              },
              separatorBuilder: (context, index) => SizedBox(width:8 ,),
              itemCount: 8
          ),
        ),
      ],
    );
  }
}
