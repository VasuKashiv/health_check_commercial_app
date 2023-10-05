import 'package:flutter/material.dart';

Widget customText(String text, double fontSize, FontWeight fontWeight,
    Color? color, EdgeInsets? padding, TextDecoration? decoration) {
  return Container(
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
            color: color ?? Colors.black,
            fontSize: fontSize,
            fontWeight: fontWeight,
            decoration: decoration ?? TextDecoration.none),
      ));
}

Widget title1(String text, Color? color, EdgeInsets? padding,
    TextDecoration? decoration) {
  return customText(text, 18, FontWeight.w700, color, padding, decoration);
}

Widget title2(String text, Color? color, EdgeInsets? padding,
    TextDecoration? decoration) {
  return customText(text, 16, FontWeight.w600, color, padding, decoration);
}

Widget title3(String text, Color? color, EdgeInsets? padding,
    TextDecoration? decoration) {
  return customText(text, 16, FontWeight.w500, color, padding, decoration);
}

Widget heading2(String text, Color? color, EdgeInsets? padding,
    TextDecoration? decoration) {
  return customText(text, 22, FontWeight.w500, color, padding, decoration);
}

Widget heading1(String text, Color? color, EdgeInsets? padding,
    TextDecoration? decoration) {
  return customText(text, 18, FontWeight.w400, color, padding, decoration);
}

Widget heading3(String text, Color? color, EdgeInsets? padding,
    TextDecoration? decoration) {
  return customText(text, 20, FontWeight.w400, color, padding, decoration);
}

Widget text1(String text, Color? color, EdgeInsets? padding,
    TextDecoration? decoration) {
  return customText(text, 18, FontWeight.w500, color, padding, decoration);
}

Widget text2(String text, Color? color, EdgeInsets? padding,
    TextDecoration? decoration) {
  return customText(text, 16, FontWeight.w500, color, padding, decoration);
}

Widget text3(String text, Color? color, EdgeInsets? padding,
    TextDecoration? decoration) {
  return customText(text, 16, FontWeight.w400, color, padding, decoration);
}

Widget text4(String text, Color? color, EdgeInsets? padding,
    TextDecoration? decoration) {
  return customText(text, 14, FontWeight.w400, color, padding, decoration);
}
