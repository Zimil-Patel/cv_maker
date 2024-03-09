import 'package:flutter/material.dart';

Color headingTxt = Colors.black;

textStyle({Color? color}) {
  return TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: color ?? headingTxt,
  );
}

inputTextStyle({Color? color}) {
  return TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: color ?? headingTxt,
  );
}

miniText({Color? color}) {
  return TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: color ?? headingTxt,
  );
}

normalText({Color? color}) {
  return TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: color ?? headingTxt,
  );
}
