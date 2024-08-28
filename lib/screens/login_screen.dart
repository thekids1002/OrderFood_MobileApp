import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:orderfood1/form/login_form.dart';
import 'package:orderfood1/utils/reponsive.dart';

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
        color: Color.fromARGB(255, 246, 234, 234),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            height: dHeight * 0.4,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0)),
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
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Color(0xFFFA4A0C), width: 1.5),
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
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'SF-PRO',
                              fontWeight: FontWeight.normal,
                              fontSize:
                                  UtilSize.responsiveFontSize(context, 18),
                              height: 0.9,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
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
                            child: Text(
                              "Sign-up",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'SF-PRO',
                                fontWeight: FontWeight.normal,
                                fontSize:
                                    UtilSize.responsiveFontSize(context, 18),
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
          const Expanded(
            child: MyForm(),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF460A),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 85, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child:  Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF-PRO',
                    fontWeight: FontWeight.w300,
                    fontSize: UtilSize.responsiveFontSize(context,15),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
