
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieWidget extends StatefulWidget {
  String StaticImage;
  String Animation;
  LottieWidget({required this.Animation,required this.StaticImage});
  @override
  State<LottieWidget> createState() => _LottieWidgetState();
}

class _LottieWidgetState extends State<LottieWidget> with SingleTickerProviderStateMixin{


  late AnimationController _controller;
  int _repeatCount = 0;
  bool _showImage = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    double width=MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Center(
          child: _showImage
              ? Image.asset(
            widget.StaticImage,width: double.infinity,height: height*0.33,fit: BoxFit.fill,) // Show this image after 5 iterations
              : Lottie.asset(
            widget.Animation,width: double.infinity,height: height*0.33,fit: BoxFit.fill,
            controller: _controller,
            onLoaded: (composition) {
              _controller.duration = composition.duration;
              _controller.addStatusListener((status) {
                if (status == AnimationStatus.completed) {
                  _repeatCount++;
                  if (_repeatCount < 5) {
                    _controller.reset();
                    _controller.forward();
                  } else {
                    setState(() {
                      _showImage = true; // Switch to the image
                    });
                  }
                }
              });
              _controller.forward();
            },
          ),
        ),
      ],
    );
  }
}
