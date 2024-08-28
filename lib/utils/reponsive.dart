import 'package:flutter/material.dart';

class UtilSize {
  static double baseFontSize = 16.0; 

  static double responsiveFontSize(BuildContext context, double baseFontSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    
   
    return baseFontSize *
        (screenWidth /
            480);
  }
}
