import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ill_vent/core/resuable_component/Dummy_widgets/Widgets-Tab/widgets/horz-itemWidget.dart';
 import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';

class TabHorzItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
              itemBuilder:  (context, index) => HorItemWidget(title: 'aaaaaaaaaaa',desc: "aaaaaaaaaaaaaaaaaaaaaaa",),
              separatorBuilder: (context, index) => SizedBox(width:8 ,),
              itemCount: 8
          ),
        ),
      ],
    );
  }
}
