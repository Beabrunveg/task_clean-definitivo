import 'package:flutter/material.dart';
/// [AppColors] is a class that contains the color constants used in the application.
class AppColors {
  static const Color green = Color(0xFF21A629);
  static const Color green50 = Color(0xFF06aa5b);
  static const Color green1000 = Color(0xFF08202a);
  static const Color blue50 = Color(0xFF008bf1);
  static const Color blue100 = Color(0xFFd0e6fd);
  static const Color yellow = Color(0xFFfff500);

  static const Color gray = Color(0xFFA4A8AE);
  static const Color gray50 = Color(0xFFededf4);
  static const Color gray100 = Color(0xFFf7f7f9);
  static const Color gray200 = Color(0xFF536f76);
  static const Color white50 = Color(0xFFE2ECF8);
  static const Color white100 = Color(0xFFE1EFE2);
  static const Color white200 = Color(0xFFF7DFDE);
  static const Color red = Color(0xFFC33131);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color bg = Color(0xFFfafcff);
/// [getShade] is a method that returns a shade of a color.
  static Color getShade(Color color, {bool darker = false, double value = .1}) {
    assert(value >= 0 && value <= 1, 'shade values must be between 0 and 1');

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness(
      (darker ? (hsl.lightness - value) : (hsl.lightness + value))
          .clamp(0.0, 1.0),
    );

    return hslDark.toColor();
  }
/// [getMaterialColorFromColor] is a method that returns a MaterialColor from a Color.
  static MaterialColor getMaterialColorFromColor(Color color) {
    final colorShades = <int, Color>{
      50: getShade(color, value: 0.5),
      100: getShade(color, value: 0.4),
      200: getShade(color, value: 0.3),
      300: getShade(color, value: 0.2),
      400: getShade(color),
      500: color,
      600: getShade(color, darker: true),
      700: getShade(color, value: 0.15, darker: true),
      800: getShade(color, value: 0.2, darker: true),
      900: getShade(color, value: 0.25, darker: true),
    };
    return MaterialColor(color.value, colorShades);
  }
}
