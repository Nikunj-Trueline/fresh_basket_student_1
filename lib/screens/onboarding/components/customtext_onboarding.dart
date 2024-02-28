import 'package:flutter/material.dart';

Widget customTextForOnboarding(
    {required String text,
    TextAlign? textAlign,
    String? fontFamily,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    ),
  );
}
