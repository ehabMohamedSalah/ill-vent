import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ill_vent/core/utils/strings_manager.dart';

import '../../../../../core/resuable_component/Dummy_widgets/Widgets-Tab/TabVertItem.dart';
import '../../../../../core/resuable_component/Dummy_widgets/Widgets-Tab/tab_horz_item.dart';
import '../../resuable_widgets/Text_widget/Text_Widget.dart';
 import '../../../../../core/utils/Appstyle.dart';
import '../../../../../data_layer/model/widget_model.dart';

List<WidgetModel>model=[
  WidgetModel(image:'assets/images/5_hospitalScreen/cleopatra-hospitals.png' ,desc: 'asssssssssaaadddddddddddddddddddddddddddddddddddddddddddddddaasssssssssss',title:StringsManager.cataflarm ),
  WidgetModel(image:'assets/images/5_hospitalScreen/cleopatra-hospitals.png' ,desc: 'asssssssssaadaaasssssssssss',title:StringsManager.alcofan ),
  WidgetModel(image:'assets/images/5_hospitalScreen/cleopatra-hospitals.png' ,desc: 'asssssssssaaaaasssssssssss',title:StringsManager.burfen ),
  WidgetModel(image:'assets/images/5_hospitalScreen/cleopatra-hospitals.png' ,desc: 'asssssssssaaaaasssssssssss',title:StringsManager.panadol),
  WidgetModel(image:'assets/images/5_hospitalScreen/cleopatra-hospitals.png' ,desc: 'asssssssssaaaaasssssssssss',title:StringsManager.adol),
  WidgetModel(image:'assets/images/5_hospitalScreen/cleopatra-hospitals.png' ,desc: 'asssssssssaaadddddddddddddddddddddddddddddddddddddddddddddddaasssssssssss',title:StringsManager.comtrex ),

];
class HospitalMobileLayout extends StatelessWidget {
  const HospitalMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextWidget( text: StringsManager.deals,),
          Container(
             width: MediaQuery.sizeOf(context).width,
              height: height*0.2 ,
              child: TabHorzItem()),
          SizedBox(height: 13,),
          TextWidget( text:StringsManager.hospital,),
           TabVertItem(modelList: model,),

        ],
      ),
    );
  }
}
