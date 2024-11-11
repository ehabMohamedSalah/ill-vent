import 'package:flutter/material.dart';
import 'package:ill_vent/core/resuable_component/Widgets-Tab/widgets/VerItemWidget.dart';

import '../../../data_layer/model/widget_model.dart';

class TabVertItem extends StatelessWidget {
 List<WidgetModel>model=[
   WidgetModel(image:'assets/images/5_hospitalScreen/cleopatra-hospitals.png' ,desc: 'asssssssssaaadddddddddddddddddddddddddddddddddddddddddddddddaasssssssssss',title:'aaaaaaa' ),
   WidgetModel(image:'assets/images/5_hospitalScreen/cleopatra-hospitals.png' ,desc: 'asssssssssaadaaasssssssssss',title:'aaaaaaa' ),
   WidgetModel(image:'assets/images/5_hospitalScreen/cleopatra-hospitals.png' ,desc: 'asssssssssaaaaasssssssssss',title:'aaaaaaa' ),
   WidgetModel(image:'assets/images/5_hospitalScreen/cleopatra-hospitals.png' ,desc: 'asssssssssaaaaasssssssssss',title:'aaaaaaa' ),
   WidgetModel(image:'assets/images/5_hospitalScreen/cleopatra-hospitals.png' ,desc: 'asssssssssaaaaasssssssssss',title:'aaaaaaa' ),



 ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder:  (context, index) => VerItemWidget(model: model[index],),
          separatorBuilder: (context, index) => SizedBox(height: 8,),
          itemCount: model.length,
      ),
    );
  }
}
