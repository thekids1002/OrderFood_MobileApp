import 'package:flutter/material.dart';
import 'package:orderfood1/screens/get_staterd_screen.dart';
import 'package:orderfood1/screens/login_screen.dart';
import 'package:orderfood1/widgets/base_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LoginScreen(),
      ),
    );
  }
}
