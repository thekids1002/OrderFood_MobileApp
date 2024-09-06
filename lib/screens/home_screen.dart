import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orderfood1/screens/search_result_screen.dart';

import '../utils/message_util.dart';
import '../utils/reponsive.dart';
import '../widgets/home/home_tab_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFFF2F2F2),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => {
                        MessageUtil.showToast("Drawer menu clicked"),
                      },
                      child: Container(
                        height: UtilSize.responsiveFontSize(context, 50),
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        child: SvgPicture.asset(
                          'assets/icons/menu.svg',
                          width: UtilSize.responsiveFontSize(context, 15),
                          height: UtilSize.responsiveFontSize(context, 15),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => {
                        MessageUtil.showToast("Cart clicked"),
                      },
                      child: Container(
                        height: UtilSize.responsiveFontSize(context, 50),
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        child: SvgPicture.asset(
                          'assets/icons/shopping-cart.svg',
                          width: UtilSize.responsiveFontSize(context, 24),
                          height: UtilSize.responsiveFontSize(context, 24),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                color: const Color(0xFFF2F2F2),
                width: double.infinity,
                height: 100,
                child: Container(
                  margin: const EdgeInsets.only(left: 25, top: 20),
                  child: Text(
                    "Delicious\n"
                    "food for you",
                    style: TextStyle(
                      fontFamily: 'SF-PRO',
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: UtilSize.responsiveFontSize(context, 30),
                      height: 1.1,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                margin: const EdgeInsets.all(25),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    hintText: "Search",
                    fillColor: const Color.fromARGB(255, 238, 231, 231),
                    prefixIcon: Container(
                      margin: EdgeInsets.only(
                          left: UtilSize.responsiveFontSize(context, 15)),
                      width: 50,
                      child: Center(
                        child: Icon(
                          Icons.search,
                          color: Colors.grey[800],
                          size: UtilSize.responsiveFontSize(context, 30),
                        ),
                      ),
                    ),
                  ),
                  onSubmitted: (value) => {handleSearch(context, value)},
                ),
              ),
              const HomeScreenTabBar(),
            ],
          ),
        );
  }
  
  Future<dynamic> handleSearch(BuildContext context, String paramsSearch) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultScreen(initialSearch: paramsSearch),
      ),
    );
  }
}