import 'package:flutter/material.dart';

import '../utils/reponsive.dart';

class LoginStyle {
  static TextStyle forgortPassFormStyle(BuildContext context) {
    return TextStyle(
      color: const Color.fromARGB(255, 141, 91, 17),
      fontSize: UtilSize.responsiveFontSize(context, 16),
      fontFamily: 'SF-PRO',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle titleFormStyle(BuildContext context) {
    return TextStyle(
      color: Colors.black45,
      fontFamily: 'SF-PRO',
      fontSize: UtilSize.responsiveFontSize(context, 15),
    );
  }
}
