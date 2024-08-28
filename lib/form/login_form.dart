import 'package:flutter/material.dart';
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
          const Text(
            "Email Address",
            style: TextStyle(
              color: Colors.black45,
              fontSize: 12,
            ),
          ),
          const BaseTextField(),
          const SizedBox(height: 20),
          const Text(
            "Password",
            style: TextStyle(
              color: Colors.black45,
              fontSize: 12,
            ),
          ),
          const BaseTextField(
            isPassword: true,
          ),
          const SizedBox(height: 25),
          const Text(
            "Forgot passcode",
            style: TextStyle(
              color: Color.fromARGB(255, 141, 91, 17),
              fontSize: 12,
              fontFamily: 'SF-PRO',
              fontWeight: FontWeight.w400,
            ),
          ),
          Center(
              child: Container(
            margin: const EdgeInsets.only(top: 50),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF460A),
                padding:
                    const EdgeInsets.symmetric(horizontal: 85, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'SF-PRO',
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
