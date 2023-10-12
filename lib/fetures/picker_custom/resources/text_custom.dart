import 'package:flutter/material.dart';
import 'package:flutter_test_app/fetures/picker_custom/resources/font_res.dart';

class CustomText extends StatelessWidget {
  final String label;
  final double fontSize;
  final Color color;
  final TextAlign? textAlign;
  final bool softWrap;
  final int? maxLines;

  const CustomText(
    this.label, {
    required this.fontSize,
    this.color = Colors.black,
    this.softWrap = true,
    this.textAlign = TextAlign.start,
    this.maxLines,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: FontRes.getStyle(
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}

class CustomSemiBoldText extends StatelessWidget {
  final String label;
  final double fontSize;
  final Color color;
  final TextAlign? textAlign;
  final bool softWrap;
  final int? maxLines;

  const CustomSemiBoldText(
    this.label, {
    required this.fontSize,
    this.color = Colors.black,
    this.softWrap = true,
    this.textAlign = TextAlign.start,
    this.maxLines,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: FontRes.getSemiBoldStyle(
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}

class CustomBoldText extends StatelessWidget {
  final String label;
  final double fontSize;
  final Color color;
  final TextAlign? textAlign;
  final bool softWrap;
  final int? maxLines;

  const CustomBoldText(
    this.label, {
    required this.fontSize,
    this.color = Colors.black,
    this.softWrap = true,
    this.textAlign = TextAlign.start,
    this.maxLines,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: FontRes.getBoldStyle(
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
