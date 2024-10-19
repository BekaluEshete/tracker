import 'package:flutter/material.dart';

class TotColors {
  static Color get primaryColor1 => const Color(0Xff92A3FD);
  static Color get primaryColor2 => const Color(0Xff9DCEFF);
  static Color get secondaryColor1 => const Color(0XffC58BF2);
  static Color get secondaryColor2 => const Color(0XffEEA4CE);

  static List<Color> get primaryG => [primaryColor1, primaryColor2];
  static List<Color> get secondaryG => [secondaryColor1, secondaryColor2];

  static Color get black => const Color(0Xff1D1617);
  static Color get grayy => const Color.fromARGB(255, 10, 6, 7);
  static Color get white => Colors.white;
}

class PieChartSectionData {
  PieChartSectionData(
      {required this.color,
      this.title,
      required this.radius,
      required this.titleStyle,
      required this.value});
  final Color color;
  final value; // Example percentage for Underweight
  final title;
  final double radius; // Adjust the radius size
  final titleStyle;
}
