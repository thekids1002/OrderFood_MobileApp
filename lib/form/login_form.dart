import 'package:flutter/material.dart';
import 'package:orderfood1/utils/reponsive.dart';
import 'package:orderfood1/widgets/text_field.dart';

import '../widgets/base_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, 
      child: Container(
        padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
        alignment: Alignment.bottomLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                const SizedBox(height: 25),
                Text(
                  "Forgot passcode",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 141, 91, 17),
                    fontSize: UtilSize.responsiveFontSize(context, 16),
                    fontFamily: 'SF-PRO',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Center(
              child: CustomElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                text: "Login",
                btnColor: const Color(0xFFFA4A0C),
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
