import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingCircle extends StatelessWidget {
  const LoadingCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitFadingCircle(
        color: Colors.red,
        size: 50.0,
    ));
  }
}
