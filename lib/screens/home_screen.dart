import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orderfood1/utils/reponsive.dart';
import 'package:orderfood1/widgets/rounded_image.dart';

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
            elevation: 0.0,
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

class TabList extends StatefulWidget {
  const TabList({super.key});

  @override
  State<TabList> createState() => _TabListState();
}

class _TabListState extends State<TabList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: const <Widget>[
        TabItem(),
        TabItem(),
        TabItem(),
        TabItem(),
      ],
    );
  }
}

class TabItem extends StatefulWidget {
  const TabItem({super.key});

  @override
  State<TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: const Color(0xFFF2F2F2),
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: 220,
            decoration: const BoxDecoration(
              color: Color(0xFFF2F2F2),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            height: 270,
            width: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08), 
                  spreadRadius: 0, 
                  blurRadius: 5,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 220,
            child: Column(
              children: [
                Center(
                  child: RoundedImage(
                    imagePath: "assets/images/image_23.png",
                    width: 150,
                    height: 150,
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Veggie \ntomato mix",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "SF-PRO",
                        fontSize: 22,
                        fontWeight: FontWeight.w400
                        ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "N1,900",
                    style: TextStyle(
                        color: Color(0xFFFA4A0C),
                        fontFamily: "SF-PRO",
                        fontSize: 17,
                        fontWeight: FontWeight.w700
                        ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
