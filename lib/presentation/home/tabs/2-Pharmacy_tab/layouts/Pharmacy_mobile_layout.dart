import 'package:flutter/material.dart';
import '../../../../../core/resuable_component/Widgets-Tab/TabVertItem.dart';
import '../../../../../core/resuable_component/Widgets-Tab/tab_horz_item.dart';
import '../../../../../core/resuable_component/Widgets-Tab/widgets/Text_Widget.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../../data_layer/model/widget_model.dart';

class PharmacyMobileLayout extends StatelessWidget {
    PharmacyMobileLayout({super.key});
  List<WidgetModel>model=[
    WidgetModel(image:'assets/images/7_pharmacyScreen/pharmacy1.png' ,desc: 'asssssssssaaadddddddddddddddddddddddddddddddddddddddddddddddaasssssssssss',title:StringsManager.cataflarm ),
    WidgetModel(image:'assets/images/7_pharmacyScreen/pharmacy2.png' ,desc: 'asssssssssaadaaasssssssssss',title:StringsManager.alcofan ),
    WidgetModel(image:'assets/images/7_pharmacyScreen/pharmacy3.png' ,desc: 'asssssssssaaaaasssssssssss',title:StringsManager.burfen ),
    WidgetModel(image:'assets/images/7_pharmacyScreen/pharmacy4.png' ,desc: 'asssssssssaaaaasssssssssss',title:StringsManager.panadol),
    WidgetModel(image:'assets/images/7_pharmacyScreen/pharmacy5.png' ,desc: 'asssssssssaaaaasssssssssss',title:StringsManager.adol),
    WidgetModel(image:'assets/images/7_pharmacyScreen/pharmacy6.png' ,desc: 'asssssssssaaadddddddddddddddddddddddddddddddddddddddddddddddaasssssssssss',title:StringsManager.comtrex ),
                        ];
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
          TextWidget( text:StringsManager.painKillers,),
          TabVertItem( modelList: model,),
        ],
      ),
    );
  }
}
