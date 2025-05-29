import 'package:flutter/material.dart';
import 'package:ill_vent/core/utils/colors_manager.dart';

class CustomButton extends StatelessWidget {
    void Function()? onPressed;
    String text;
    CustomButton(this.onPressed,this.text);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.secondaryColor,
        ),
        onPressed:  onPressed,
        child: Text(text),
      ),
    );
  }
}
