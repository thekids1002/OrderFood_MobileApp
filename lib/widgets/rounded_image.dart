import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;

  const RoundedImage({
    super.key,
    required this.imagePath,
    this.width = 150,
    this.height = 150,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent, // Nền trong suốt
        ),
        child: ClipOval(
          child: Image.asset(
            imagePath,
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
