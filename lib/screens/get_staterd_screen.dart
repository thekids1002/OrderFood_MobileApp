import 'package:flutter/material.dart';
import 'package:orderfood1/utils/reponsive.dart';

import '../widgets/base_button.dart';

class GetStatredScreen extends StatelessWidget {
  const GetStatredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double dwidth = MediaQuery.of(context).size.width;
    double dheight = MediaQuery.of(context).size.height;
    return Container(
      color: const Color(0xfffff4b3a),
      width: double.infinity,
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 25),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            child: Center(
              child: Image.asset(
                'assets/images/flash_screen_top_icon.png',
                height: 40,
                width: 40,
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            margin: const EdgeInsets.only(left: 25, top: 20),
            child: Text(
              "Food for "
              "Everyone",
              style: TextStyle(
                fontFamily: 'SF-PRO',
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: UtilSize.responsiveFontSize(context, 55),
                height: 0.9,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 25, top: 25),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: Transform.rotate(
                      angle: 0.1,
                      child: Image.asset(
                        "assets/images/toy_faces_tansparent_bg_29.png",
                        width: dwidth * 0.4,
                        height: dheight * 0.5,
                      ),
                    ),
                  ),
                  Container(
                    child: Transform.rotate(
                      alignment: Alignment.bottomLeft,
                      angle: -0.05,
                      child: Image.asset(
                        "assets/images/toy_faces_tansparent_bg_49.png",
                        width: dwidth * 0.6,
                        height: dheight * 0.5,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: UtilSize.responsiveFontSize(context,dheight * 0.5),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFFFF470B).withOpacity(0.1),
                            const Color(0xfffff4b3a),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: CustomElevatedButton(
              text: "Get Started",
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
