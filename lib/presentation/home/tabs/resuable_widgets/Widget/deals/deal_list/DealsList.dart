import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ill_vent/Domain/entity/dr_entity.dart';

import 'dealCardWidget/DealCardWidget.dart';

class DealsList extends StatelessWidget {
  List<DrEntity>modelList;

  DealsList(this.modelList);
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
                  return DealCardWidget(entity: entity);
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
