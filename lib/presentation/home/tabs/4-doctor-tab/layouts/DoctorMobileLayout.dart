import 'package:flutter/material.dart';

import '../../../../../core/resuable_component/Widgets-Tab/TabVertItem.dart';
import '../../../../../core/resuable_component/Widgets-Tab/tab_horz_item.dart';
import '../../../../../core/resuable_component/Widgets-Tab/widgets/Text_Widget.dart';
import '../../../../../core/utils/strings_manager.dart';

class DoctorMobileLayout extends StatelessWidget {
  const DoctorMobileLayout({super.key});

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
          TabVertItem(),

        ],
      ),
    );
  }
}
