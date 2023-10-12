import 'package:flutter/material.dart';

extension ColorRes on Colors {
  static Color fromHexString(String hex) {
    final buffer = StringBuffer();
    if (hex.length == 6 || hex.length == 7) buffer.write('ff');
    buffer.write(hex.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static const Color primary = Color(0xFF004A85);
  static const Color secondary = Color(0xFF73C8AE);
  static const Color negative = Color(0xFFFD6262);

  static const Color softGray = Color(0xFFF4F4F4);
  static const Color lightGray = Color(0xFFC4C4C4);

  static const Color border = Color(0xFFDEDEDE);

  static const Color primaryText = Color(0xFF191A1C);
  static const Color secondaryText = Color(0xFF6E6B7C);
  static const Color successText = Color(0xFF34C759);

  static const Color container = Color(0xFFF4F4F4);
}
