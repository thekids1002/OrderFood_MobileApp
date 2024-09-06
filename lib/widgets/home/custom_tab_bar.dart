import 'package:flutter/material.dart';
import 'package:orderfood1/widgets/home/tab_list.dart';

import '../../utils/reponsive.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});
  static double tabWidth = 100.0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
          left: UtilSize.responsiveFontSize(context, 24),
          right: UtilSize.responsiveFontSize(context, 24),
        ),
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 0,
              elevation: 0,
              backgroundColor: const Color(0xFFF2F2F2),
              bottom: PreferredSize(
                preferredSize:
                    const Size.fromHeight(50.0), // Adjust height as needed
                child: Container(
                  child: TabBar(
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    labelColor:
                        const Color(0xFFFA4A0C), // Color for selected tab
                    unselectedLabelColor:
                        const Color(0xFF9A9A9D), // Color for unselected tabs
                    indicatorColor: const Color(0xFFFA4A0C),
                    labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    dividerColor: Colors.transparent,
                    tabs: [
                      Tab(
                        child: SizedBox(
                          width: tabWidth,
                          child: Center(
                            child: Text(
                              "Foods",
                              style: TextStyle(
                                fontFamily: 'SF-PRO',
                                fontWeight: FontWeight.w300,
                                fontSize:
                                    UtilSize.responsiveFontSize(context, 14),
                                height: 0.9,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          width: tabWidth,
                          child: Center(
                            child: Text(
                              "Drinks",
                              style: TextStyle(
                                fontFamily: 'SF-PRO',
                                fontWeight: FontWeight.w300,
                                fontSize:
                                    UtilSize.responsiveFontSize(context, 14),
                                height: 0.9,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          width: tabWidth,
                          child: Center(
                            child: Text(
                              "Snacks",
                              style: TextStyle(
                                fontFamily: 'SF-PRO',
                                fontWeight: FontWeight.w300,
                                fontSize:
                                    UtilSize.responsiveFontSize(context, 14),
                                height: 0.9,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          width: tabWidth,
                          child: Center(
                            child: Text(
                              "Sauce",
                              style: TextStyle(
                                fontFamily: 'SF-PRO',
                                fontWeight: FontWeight.w300,
                                fontSize:
                                    UtilSize.responsiveFontSize(context, 14),
                                height: 0.9,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: const TabBarView(
              children: [
                Center(child: TabList()),
                Center(child: Icon(Icons.directions_transit, size: 100)),
                Center(child: Icon(Icons.directions_car, size: 100)),
                Center(child: Icon(Icons.directions_car, size: 100)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
