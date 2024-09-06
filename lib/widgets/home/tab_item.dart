import 'package:flutter/material.dart';

import '../rounded_image.dart';

class TabItem extends StatefulWidget {
  const TabItem({super.key});

  @override
  State<TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: const Color(0xFFF2F2F2),
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: 220,
            decoration: const BoxDecoration(
              color: Color(0xFFF2F2F2),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            height: 270,
            width: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 220,
            child: Column(
              children: [
                Center(
                  child: RoundedImage(
                    imagePath: "assets/images/image_23.png",
                    width: 150,
                    height: 150,
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Veggie \ntomato mix",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "SF-PRO",
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "N1,900",
                    style: TextStyle(
                        color: Color(0xFFFA4A0C),
                        fontFamily: "SF-PRO",
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
