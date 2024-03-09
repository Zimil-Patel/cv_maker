import 'package:flutter/material.dart';

Color headingTxt = Colors.white;

textStyle() {
  return TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: headingTxt,
  );
}

inputTextStyle() {
  return TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: headingTxt,
  );
}

miniText(Color color) {
  return TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: color,
  );
}

normalText(Color color) {
  return TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: color,
  );
}
