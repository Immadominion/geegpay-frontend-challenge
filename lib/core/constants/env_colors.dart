import 'package:flutter/material.dart';
import 'package:geegpay_afrique/core/extensions/color_extension.dart';

/// Color Guide Notice (Primary ORANGE, INFO COLOR)
/// Ranging from (50-900)
/// 50 = Light, 100 = Light :hover, 200 = Light :active,
/// 300 = Normal, 400 = Normal :hover, 500 = Normal :active,
/// 600 = Dark, 700 = Dark :hover, 800 = Dark :active, 800 = Darker

/// Color Guide Notice (GREYS)
/// Ranging from (50-900)
/// 50 = Normal, 100 = Normal :hover, 200 = Normal :active,
/// 300 = Dark, 400 = Dark :hover, 500 = Dark :active,
/// 600 = Darker, 700 = Dark :hover, 800 = Dark :active, 800 = Darker
///

class GeegyColors {
  // static final ProviderContainer container = ProviderContainer();

  static Color appBackgroundColor = '#FAFAFA'.toColor();
  static Color primaryColor = const Color.fromARGB(255, 8, 212, 137);
  static Color secondaryColor = '#3A3F51'.toColor();
  static Color successColor = '#00AC56'.toColor();
  static Color warningColor = '#F5BF3D'.toColor();
  static Color errorColor = '#FF1F7D'.toColor();
  static Color purpleColor = const Color.fromARGB(255, 97, 96, 220);
  static Color blueColor = const Color.fromARGB(255, 84, 197, 235);
  static Color orangeColor = const Color.fromARGB(255, 255, 183, 74);
  static Color purpColor = const Color.fromARGB(255, 255, 74, 85);
  static Color whiteColor = const Color.fromARGB(255, 255, 255, 255);
  static Color greyColor = const Color.fromARGB(255, 236, 235, 235);
  static Color darkGreyColor = const Color.fromARGB(255, 158, 158, 158);
  static Color darkColor = const Color.fromARGB(255, 0, 0, 0);
  //static final int _errorColorValue = '#FF1F7D'.toColor();
  // static int _warningColorValue = '#F5BF3D'.toColor();
  // static int _successColorValue = '#00AC56'.toColor();
  // static int _primaryColorValue = '#BB372F'.toColor();
  // static int _secondaryColorValue = '#3A3F51'.toColor();
  static List<Color> containerGradient = [
    primaryColor,
    successColor,
    primaryColor.withOpacity(0.5),
    primaryColor.withOpacity(0.3),
    primaryColor.withOpacity(0.1),
    appBackgroundColor.withOpacity(0.5),
  ];
}
