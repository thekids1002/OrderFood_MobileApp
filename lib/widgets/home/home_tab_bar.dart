
import 'package:flutter/material.dart';
import 'package:orderfood1/widgets/home/tab_item.dart';

import '../../models/product.dart';
import '../../models/category.dart';
import '../../services/product_services.dart';
import '../../services/category_services.dart';
import '../../utils/reponsive.dart';

class HomeScreenTabBar extends StatefulWidget {
  static double tabWidth = 100.0;
  const HomeScreenTabBar({super.key});
  @override
  State<HomeScreenTabBar> createState() => _HomeScreenTabBarState();
}

class _HomeScreenTabBarState extends State<HomeScreenTabBar> {
  late Future<List<Category>> tabsFuture;
  late Future<List<Product>> productsFuture;

  int _selectedTabId = 1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
        future: tabsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No Data Available'));
          } else {
            final tabs = snapshot.data!;
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
                        preferredSize: const Size.fromHeight(
                            50.0), // Adjust height as needed
                        child: Container(
                          child: TabBar(
                            tabAlignment: TabAlignment.start,
                            isScrollable: true,
                            labelColor: const Color(0xFFFA4A0C),
                            unselectedLabelColor: const Color(0xFF9A9A9D),
                            indicatorColor: const Color(0xFFFA4A0C),
                            labelPadding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            dividerColor: Colors.transparent,
                            onTap: (index) {
                              final tabId = tabs[index].id;
                              _onTabChanged(tabId);
                            },
                            tabs: tabs
                                .map(
                                  (tab) => Tab(
                                    child: SizedBox(
                                      width: HomeScreenTabBar.tabWidth,
                                      child: Center(
                                        child: Text(
                                          tab.title,
                                          style: TextStyle(
                                            fontFamily: 'SF-PRO',
                                            fontWeight: FontWeight.w300,
                                            fontSize:
                                                UtilSize.responsiveFontSize(
                                                    context, 14),
                                            height: 0.9,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                    body: FutureBuilder<List<Product>>(
                      future: productsFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData) {
                          return const Center(child: Text('No Data Available'));
                        }

                        final products = snapshot.data!;
                        return Container(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              final product = products[index];
                              return TabItem(
                                imagePath: product.imagePath,
                                name: product.name,
                                price: product.price,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          }
        });
  }

  @override
  void initState() {
    super.initState();
    tabsFuture = CategoryServices().fetchCategories().then((tabs) {
      if (tabs.isNotEmpty) {
        _selectedTabId = tabs[0].id;
        productsFuture =
            ProductServices().fetchProductsByCategoryId(_selectedTabId);
      }
      return tabs;
    });
  }

  void _onTabChanged(int tabId) {
    setState(() {
      _selectedTabId = tabId;
      productsFuture = ProductServices().fetchProductsByCategoryId(tabId);
    });
  }
}
