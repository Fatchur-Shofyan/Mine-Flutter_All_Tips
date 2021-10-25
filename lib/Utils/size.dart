import 'package:flutter/cupertino.dart';

class CustomSize {
  static double mobileWidth = 360.0;
  static double mobileHeight = 640.0;

  static double iconbig = 130.0;

  static double textXlbig = 40.0;
  static double textXbig = 30.0;

  static double fontTitle = 22.0;

  static double fontNormal = 16.0;
}

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double screenWidth = 450;
  static double screenHeight = 900;
  static double blockSizeHorizontal = 0;
  static double blockSizeVertical = 0;

  static double? textMultiplier;
  static double? imageSizeMultiplier;
  static double? heightMultiplier;
  static double? widthMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;

    if (screenWidth < 450) {
      isMobilePortrait = true;
    }

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    textMultiplier = blockSizeVertical;
    imageSizeMultiplier = blockSizeHorizontal;
    heightMultiplier = blockSizeVertical;
    widthMultiplier = blockSizeHorizontal;
  }
}
