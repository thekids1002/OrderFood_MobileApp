import 'package:flutter/material.dart';
import 'package:orderfood1/utils/reponsive.dart';
import 'package:orderfood1/widgets/text_field.dart';

class MyForm extends StatelessWidget {
  const MyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
      alignment: Alignment.bottomLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email Address",
            style: TextStyle(
              color: Colors.black45,
              fontFamily: 'SF-PRO',
              fontSize: UtilSize.responsiveFontSize(context, 13),
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
              fontSize: UtilSize.responsiveFontSize(context, 13),
            ),
          ),
          const BaseTextField(
            isPassword: true,
            hintText: "Password",
          ),
          const SizedBox(height: 25),
          Text(
            "Forgot passcode",
            style: TextStyle(
              color: Color.fromARGB(255, 141, 91, 17),
              fontSize: UtilSize.responsiveFontSize(context, 16),
              fontFamily: 'SF-PRO',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
