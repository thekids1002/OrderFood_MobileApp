import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:orderfood1/form/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double dWidth = MediaQuery.of(context).size.width;
    double dHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.only(top: 24),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            height: dHeight * 0.4,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Expanded(
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Center(
                        child: Image.asset("assets/images/login_main_logo.png"),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(color: Color(0xFFFA4A0C), width: 2),
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.fromLTRB(50, 10, 50, 10)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'SF-PRO',
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              height: 0.9,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                        flex: 1,
                        child: Container(
                          // decoration: const BoxDecoration(
                          //   border: Border(
                          //     bottom: BorderSide(
                          //         color: Color(0xFFFA4A0C), width: 2),
                          //   ),
                          // ),
                          child: TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.fromLTRB(50, 10, 50, 10)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                            ),
                            child: const Text(
                              "Sign-up",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'SF-PRO',
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                height: 0.9,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
          const MyForm(),
        ],
      ),
    );
  }
}
