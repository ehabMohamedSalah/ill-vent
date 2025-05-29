import 'package:flutter/material.dart';

class ErrorWidgett extends StatelessWidget {
  void Function()? onPressed;
  String message;
  ErrorWidgett({required this.message,required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Text("Error: ${message}"),
          Text("Error: Internet Connection"),
          ElevatedButton(
            onPressed:  onPressed,
            child: Text("Try Again"),
          ),
        ],
      ),
    );;
  }
}
