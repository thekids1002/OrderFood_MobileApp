import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:orderfood1/form/login_form.dart';
import 'package:orderfood1/form/register_form.dart';
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

    return Stack(
      children: [
        Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFF2F2F2),
          ),
        ),
        Container(
          height: dHeight * 0.4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0)),
          ),
          child: Center(
            child: Image.asset("assets/images/login_main_logo.png"),
          ),
        ),
        Container(
          height: dHeight * 0.675,
          margin: EdgeInsets.only(top: dHeight * 0.325),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.transparent,
                  child: TabBar(
                    tabs: [
                      Tab(
                        child: Container(
                          width: 100,
                          child: Center(
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
                      Tab(
                        child: Container(
                          width: 100,
                          child: Center(
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
                        ),
                      ),
                    ],
                    labelColor: Colors.black,
                    dividerColor: Colors.transparent,
                    indicatorColor: Color(0xFFFA4A0C),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Center(child: LoginForm()),
                      Center(child: RegisterForm()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF460A),
            padding: const EdgeInsets.symmetric(horizontal: 85, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 0,
          ),
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'SF-PRO',
              fontWeight: FontWeight.w300,
              fontSize: UtilSize.responsiveFontSize(context, 15),
            ),
          ),
        ),
      ),
    );
  }
}
