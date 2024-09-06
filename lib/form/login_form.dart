import 'package:flutter/material.dart';
import 'package:orderfood1/screens/main_screen.dart';
import 'package:orderfood1/themes/login_styles.dart';
import 'package:orderfood1/validation/email_validator.dart';
import 'package:orderfood1/validation/password_validator.dart';
import 'package:orderfood1/widgets/app_text_field.dart';

import '../widgets/primary_button.dart';

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
                  style: LoginStyle.titleFormStyle(context),
                ),
                const AppTextField(
                  hintText: "Email",
                  validator: EmailValidator.validateEmail,
                ),
                const SizedBox(height: 20),
                Text(
                  "Password",
                  style: LoginStyle.titleFormStyle(context),
                ),
                const AppTextField(
                  isPassword: true,
                  hintText: "Password",
                  validator: PasswordValidator.validatePassword,
                ),
                const SizedBox(height: 25),
                Text(
                  "Forgot passcode",
                  style: LoginStyle.forgortPassFormStyle(context),
                ),
              ],
            ),
            Center(
              child: PrimaryButton(
                onPressed: () {
                  handleLoginSubmit(context);
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

  void handleLoginSubmit(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
      );
    }
  }
}
