import 'package:flutter/material.dart';
import 'color_res.dart';

class FontRes {
  static TextStyle getStyle({
    required double fontSize,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: 'SukhumvitSet-Text',
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color ?? ColorRes.primaryText,
    );
  }


  static TextStyle getSemiBoldStyle({
    required double fontSize,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: 'SukhumvitSet-SemiBold',
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: color ?? ColorRes.primaryText,
    );
  }

  static TextStyle getBoldStyle({
    required double fontSize,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: 'SukhumvitSet-Bold',
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: color ?? ColorRes.primaryText,
    );
  }
}
