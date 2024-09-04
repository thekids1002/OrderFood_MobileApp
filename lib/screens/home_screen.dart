import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orderfood1/utils/reponsive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding:
              EdgeInsets.only(top: UtilSize.responsiveFontSize(context, 35)),
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
                      onTap: () => print("hello"),
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
                      onTap: () => print("cart clicked"),
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
                ),
              ),
              const CustomTabBar(), // Sử dụng widget CustomTabBar
            ],
          ),
        ),
        bottomNavigationBar: Container(
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            selectedItemColor: const Color(0xFFFA4A0C),
            backgroundColor: const Color(0xFFF2F2F2),
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  _selectedIndex == 0 ? Icons.home : Icons.home_outlined,
                  size: 30,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  _selectedIndex == 1 ? Icons.favorite : Icons.favorite_border,
                  size: 30,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  _selectedIndex == 2 ? Icons.person : Icons.person_outline,
                  size: 30,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  _selectedIndex == 3 ? Icons.history : Icons.history_outlined,
                  size: 30,
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});
  static double tabWidth = 100.0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                unselectedLabelColor: Colors.white.withOpacity(0.3),
                indicatorColor: const Color(0xFFFA4A0C),
                labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                tabs: [
                  Tab(
                    child: SizedBox(
                      width: tabWidth,
                      child: Center(
                        child: Text(
                          "Foods",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'SF-PRO',
                            fontWeight: FontWeight.normal,
                            fontSize: UtilSize.responsiveFontSize(context, 14),
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
                            color: Colors.black,
                            fontFamily: 'SF-PRO',
                            fontWeight: FontWeight.normal,
                            fontSize: UtilSize.responsiveFontSize(context, 14),
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
                            color: Colors.black,
                            fontFamily: 'SF-PRO',
                            fontWeight: FontWeight.normal,
                            fontSize: UtilSize.responsiveFontSize(context, 14),
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
                            color: Colors.black,
                            fontFamily: 'SF-PRO',
                            fontWeight: FontWeight.normal,
                            fontSize: UtilSize.responsiveFontSize(context, 14),
                            height: 0.9,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Icon(Icons.flight, size: 100),
                Icon(Icons.directions_transit, size: 100),
                Icon(Icons.directions_car, size: 350),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
