
import 'package:flutter/material.dart';

import '../../../../../core/resuable_component/Widgets-Tab/TabVertItem.dart';
import '../../../../../core/resuable_component/Widgets-Tab/tab_horz_item.dart';
import '../../../../../core/resuable_component/Widgets-Tab/widgets/Text_Widget.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../../data_layer/model/widget_model.dart';

List<WidgetModel>model=[
  WidgetModel(image:'assets/images/8_shop/shop1.png' ,desc: 'asssssssssaaadddddddddddddddddddddddddddddddddddddddddddddddaasssssssssss',title:'lotion' ),
  WidgetModel(image:'assets/images/8_shop/shop2.png' ,desc: 'asssssssssaadaaasssssssssss',title:'body splash' ),
  WidgetModel(image:'assets/images/8_shop/shop3.png' ,desc: 'asssssssssaaaaasssssssssss',title:'body splash' ),
  WidgetModel(image:'assets/images/8_shop/shop4.png' ,desc: 'asssssssssaaaaasssssssssss',title:'body splash'),
  WidgetModel(image:'assets/images/8_shop/shop5.png' ,desc: 'asssssssssaaaaasssssssssss',title:'body splash'),
  WidgetModel(image:'assets/images/8_shop/shop6.png' ,desc: 'asssssssssaaadddddddddddddddddddddddddddddddddddddddddddddddaasssssssssss',title:'body splash' ),

];
class ShopMobileLayout extends StatelessWidget {
  const ShopMobileLayout({super.key});

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
          TextWidget( text:StringsManager.shop,),
          TabVertItem(modelList: model,),

        ],
      ),
    );
  }
}
