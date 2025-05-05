import 'package:flutter/cupertino.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';

import '../../../../../core/utils/Appstyle.dart';

class TextWidget extends StatelessWidget {
  TextWidget(  {required this.text});
  String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(
              color: ColorManager.secondaryColor,
              borderRadius: BorderRadius.circular(40),

            ),
            child: Center(
              child: Text(
                text,style: Appstyle.medium25(context),
              ),
            ),
          ),
        ),
        SizedBox(height: 20,),
      ],
    );
  }
}
