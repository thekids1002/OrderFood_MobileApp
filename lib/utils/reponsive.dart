import 'package:flutter/material.dart';

class UtilSize {
  static double baseFontSize = 16.0;

  static double responsiveFontSize(BuildContext context, double baseFontSize) {
    return (baseFontSize / 720) * MediaQuery.of(context).size.height;
  }
}
