import 'package:flutter/material.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';

import 'item.dart';



class DropdownButtonWidget extends StatefulWidget {
  @override
  _DropdownButtonWidgetState createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: ColorManager.secondaryColor, // Change dropdown menu background color
      ),
      child: DropdownButton<String>(

        style: Appstyle.small15(context),
        hint: Text("Payment Method", style: Appstyle.small15(context)),
        iconEnabledColor: Colors.white,


        value: _selectedOption,
        items: [
          DropdownMenuItem(
            value: "Cash",
            child: RowItem(Image:"assets/images/4_drawer/cash-stack.svg" ,text: "Cash",onTap: (){},),

          ),
          DropdownMenuItem(
            value: "Credit",
            child:  RowItem(Image:"assets/images/4_drawer/credit-card-2-back-fill.svg" ,text: "Credit",onTap: (){}),

          ),
        ],
        onChanged: (String? value) {
          setState(() {
            _selectedOption = value;
          });
          print("Selected: $value");
        },
      ),
    );
  }
}
