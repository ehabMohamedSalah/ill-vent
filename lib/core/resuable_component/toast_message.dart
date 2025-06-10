import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

enum TybeMessage {
  positive,
  negative,
}

void toastMessage({required String message, required TybeMessage tybeMessage}) {
  showToast(
    message,
    duration: Duration(seconds: 2),
    position: ToastPosition.bottom,
    backgroundColor: tybeMessage == TybeMessage.positive ? Colors.green : Colors.red,
    textStyle: TextStyle(color: Colors.white, fontSize: 16.0),
    radius: 20.0,
  );
}