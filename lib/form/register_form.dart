import 'package:flutter/material.dart';
import 'package:orderfood1/screens/main_screen.dart';
import 'package:orderfood1/themes/login_styles.dart';
import 'package:orderfood1/validation/email_validator.dart';
import 'package:orderfood1/validation/password_validator.dart';
import 'package:orderfood1/widgets/app_text_field.dart';

import '../widgets/primary_button.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

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
                AppTextField(
                  isPassword: true,
                  hintText: "Password",
                  validator: PasswordValidator.validatePassword,
                  controller: _pass,
                ),
                const SizedBox(height: 20),
                Text(
                  "Re-Password",
                  style: LoginStyle.titleFormStyle(context),
                ),
                AppTextField(
                  isPassword: true,
                  hintText: "Re-Password",
                  validator: (value) =>
                      PasswordValidator.validateRepassword(value, _pass.text),
                  controller: _confirmPass,
                ),
              ],
            ),
            Center(
              child: PrimaryButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
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
