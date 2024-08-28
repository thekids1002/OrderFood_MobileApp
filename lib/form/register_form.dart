import 'package:flutter/material.dart';
import 'package:orderfood1/utils/reponsive.dart';
import 'package:orderfood1/widgets/text_field.dart';
import '../widgets/base_button.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
      alignment: Alignment.bottomLeft,
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Chia khoảng cách đều
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email Address",
                style: TextStyle(
                  color: Colors.black45,
                  fontFamily: 'SF-PRO',
                  fontSize: UtilSize.responsiveFontSize(context, 15),
                ),
              ),
              const BaseTextField(
                hintText: "Email",
              ),
              const SizedBox(height: 20),
              Text(
                "Password",
                style: TextStyle(
                  color: Colors.black45,
                  fontFamily: 'SF-PRO',
                  fontSize: UtilSize.responsiveFontSize(context, 15),
                ),
              ),
              const BaseTextField(
                isPassword: true,
                hintText: "Password",
              ),
              const SizedBox(height: 20),
              Text(
                "Re-Password",
                style: TextStyle(
                  color: Colors.black45,
                  fontFamily: 'SF-PRO',
                  fontSize: UtilSize.responsiveFontSize(context, 15),
                ),
              ),
              const BaseTextField(
                isPassword: true,
                hintText: "Re-Password",
              ),
            ],
          ),
          Center(
            child: CustomElevatedButton(
              onPressed: () {},
              text: "Register",
              btnColor: const Color(0xFFFA4A0C),
              textColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
