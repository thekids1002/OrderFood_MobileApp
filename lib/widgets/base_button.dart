import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 85, vertical: 20), // Padding cho nút
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 0, // Đặt độ nổi của nút
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFFFF460A),
          fontFamily: 'SF-PRO',
          fontWeight: FontWeight.w300,
          fontSize: 15,
        ),
      ),
    );
  }
}
