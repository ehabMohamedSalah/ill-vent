import 'package:flutter/material.dart';
import 'package:ill_vent/core/utils/size_config.dart';

import 'colors_manager.dart';

abstract class Appstyle{

  static TextStyle smallLabelText(BuildContext context) {
    return TextStyle(
      color: Colors.black,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle small20(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
    );
  }
  static TextStyle small15(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      color: Colors.white,
      overflow:TextOverflow.ellipsis ,
      fontSize: getResponsiveFontSize(context, fontSize: 15),
    );
  }

  static TextStyle medium25(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      color: ColorManager.white,
      fontSize: getResponsiveFontSize(context, fontSize: 25),
    );
  }
  static TextStyle large30(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 30),
        color: ColorManager.white,
        fontWeight: FontWeight.w700
    );
  }
  static TextStyle labelRegisterStyle(BuildContext context) {
    return TextStyle(

        fontSize: getResponsiveFontSize(context, fontSize: 15),
        color: ColorManager.white,
        fontWeight: FontWeight.w700,
      overflow: TextOverflow.ellipsis,

    );
  }

}


// sacleFactor
// responsive font size
// (min , max) fontsize
  double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < 600) {
    return width / 400;
  } else if (width < SizeConfig.tablet) {
    return width / 700;
  } else {
    return width / 1000;
  }
}



