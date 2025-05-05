import 'package:flutter/material.dart';
import 'package:ill_vent/core/resuable_component/Dummy_widgets/Widgets-Tab/widgets/VerItemWidget.dart';
 import 'package:ill_vent/core/utils/strings_manager.dart';
import 'package:ill_vent/data_layer/model/Hospital_response.dart';

import '../../../../data_layer/model/widget_model.dart';

class TabVertItem extends StatelessWidget {
  TabVertItem({required this.modelList});
   List<dynamic> modelList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder:  (context, index) => VerItemWidget(model: modelList[index],),
          separatorBuilder: (context, index) => SizedBox(height: 8,),
          itemCount: modelList.length,
      ),
    );
  }
}
