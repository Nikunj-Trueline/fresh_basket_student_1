import 'package:flutter/material.dart';

// Custom Text For SignIn Screen

Widget customTextForSignIn({
  required String text,
  TextAlign? textAlign,
  Color? color,
  String? fontFamily,
  double? fontSize,
  FontWeight? fontWeight,
  double? letterSpacing,
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      color: color,
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
    ),
  );
}
