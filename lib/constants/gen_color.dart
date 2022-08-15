import 'package:el_flutter/constants/regex.dart';
import 'package:flutter/material.dart';

class GenColor {
  /// primary color section;
  static Color primary = ColorUtils.hexToColor('#007BFF');
  static Color primaryDark = ColorUtils.hexToColor('#343A40');
  static Color primaryDarkLight = ColorUtils.hexToColor('#454D55');
  static Color primaryInfo = ColorUtils.hexToColor('#17A2B8');
  static Color primarySuccess = ColorUtils.hexToColor('#28A745');
  static Color primaryWarning = ColorUtils.hexToColor('#FFC107');
  static Color primaryDanger = ColorUtils.hexToColor('#DC3545');
  static Color primaryTextDark = ColorUtils.hexToColor('#C2C7D0');
  static Color separator = ColorUtils.hexToColor('#4B545C');
  static Color secondaryBorderDark = ColorUtils.hexToColor('#56606A');
  static Color c3F474E = ColorUtils.hexToColor('#3F474E');
  static Color cADB5BD = ColorUtils.hexToColor('#ADB5BD');

  /// link color section;
  static Color link = ColorUtils.hexToColor('#007BFF');
  static Color linkNav = ColorUtils.rgboToColor('255, 255, 255, .75');
}

class ColorUtils {
  static Color hexToColor(String hexColor) {
    hexColor = hexColor.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return Color(int.parse('0x$hexColor'));
  }

  static Color rgboToColor(String rgbo) {
    List<String> splitStr = rgbo.replaceAll(Regex.whiteSpace, '').split(',');
    int r = int.parse(splitStr.first);
    int g = int.parse(splitStr.elementAt(1));
    int b = int.parse(splitStr.elementAt(2));
    double opacity = double.parse(splitStr.last);
    return Color.fromRGBO(r, g, b, opacity);
  }
}
