import 'package:flutter/material.dart';
import 'package:ill_vent/Domain/entity/dr_entity.dart';
import 'package:ill_vent/core/resuable_component/Widgets-Tab/widgets/VerItemWidget.dart';
import 'package:ill_vent/core/resuable_component/Widgets-Tab/widgets/VerItemWidget1.dart';
import 'package:ill_vent/core/utils/strings_manager.dart';

import '../../../data_layer/model/widget_model.dart';

class TabVertItem1 extends StatelessWidget {
  TabVertItem1({required this.modelList});
  List<DrEntity>modelList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder:  (context, index) => VerItemWidget1(model: modelList[index],),
        separatorBuilder: (context, index) => SizedBox(height: 8,),
        itemCount: modelList.length,
      ),
    );
  }
}
