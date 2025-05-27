import 'package:flutter/material.dart';

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
          backgroundColor: Colors.pinkAccent,
        ),
        onPressed:  onPressed,
        child: Text(text),
      ),
    );
  }
}
