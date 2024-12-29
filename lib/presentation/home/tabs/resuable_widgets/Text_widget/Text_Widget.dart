import 'package:flutter/cupertino.dart';

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
          child: Text(
            text,style: Appstyle.medium25(context),
          ),
        ),
        SizedBox(height: 20,),
      ],
    );
  }
}
