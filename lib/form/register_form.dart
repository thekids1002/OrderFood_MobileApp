import 'package:flutter/material.dart';
import 'package:orderfood1/utils/reponsive.dart';
import 'package:orderfood1/validation/email_validator.dart';
import 'package:orderfood1/validation/password_validator.dart';
import 'package:orderfood1/widgets/text_field.dart';

import '../widgets/base_button.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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
                  validator: EmailValidator.validateEmail,
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
                  validator: PasswordValidator.validatePassword,
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
                  validator: PasswordValidator.validatePassword,
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
                text: "Register",
                btnColor: const Color(0xFFFA4A0C),
                textColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
