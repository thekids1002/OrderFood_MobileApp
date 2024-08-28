import 'package:flutter/material.dart';
import 'package:orderfood1/utils/reponsive.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color btnColor;
  final Color textColor;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.btnColor = Colors.transparent,
    this.textColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      width: 250,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor != Colors.transparent ? btnColor : Colors.white,
          padding: const EdgeInsets.symmetric(
              horizontal: 85, vertical: 20), // Padding cho nút
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0, // Đặt độ nổi của nút
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor != Colors.transparent ?  textColor : Color(0xFFFA4A0C),
            fontFamily: 'SF-PRO',
            fontWeight: FontWeight.w300,
            fontSize: UtilSize.responsiveFontSize(context, 15),
          ),
        ),
      ),
    );
  }
}
