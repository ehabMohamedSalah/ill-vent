import 'package:flutter/material.dart';
import 'package:ill_vent/Domain/entity/dr_entity.dart';
 import 'package:ill_vent/core/utils/strings_manager.dart';

import '../deals/deal_list/dealCardWidget/DealCardWidget.dart';
import '../deals/deal_list/dealCardWidget/DealDetailsScreen/DealDetailsScreen.dart';
import 'Card_Widget/Card_Widget.dart';


class ListScreen extends StatelessWidget {
  ListScreen({required this.modelList});
  List<DrEntity>modelList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder:  (context, index) => GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:  (context) => DealDetailsScreen(  deal: modelList[index],),));
            },
            child: CardWidget(model: modelList[index],)),
        separatorBuilder: (context, index) => SizedBox(height: 8,),
        itemCount: modelList.length,
      ),
    );
  }
}
