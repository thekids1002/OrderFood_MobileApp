import 'dart:math';

import 'package:flutter/material.dart';
import 'package:orderfood1/widgets/search_result/tab_item.dart';

import '../../models/product.dart';
import '../../services/product_services.dart';
import '../../utils/message_util.dart';

class SearchResultBody extends StatefulWidget {
  const SearchResultBody({super.key});

  @override
  State<SearchResultBody> createState() => _SearchResultBodyState();
}

class _SearchResultBodyState extends State<SearchResultBody> {
  late Future<List<Product>> futureProducts;
  @override
  void initState() {
    super.initState();
    futureProducts = ProductServices().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products found'));
          } else {
            final products = snapshot.data!;
            return RefreshIndicator(
              onRefresh: _refresh,
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25),
                            child: Text(
                              "Found ${products.length} results",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: "SF-PRO",
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.5,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                              padding: const EdgeInsets.all(10),
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () => {
                                    MessageUtil.showToast(products[index].name)
                                  },
                                  child: TabItem(product: products[index]),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  )
                ],
              ),
            );
          }
        });
  }

  Future<void> _refresh() async {
    try {
      List<Product> updatedProducts = await ProductServices().fetchProducts();
      setState(() {
        futureProducts = Future.value(updatedProducts);
      });
      MessageUtil.showToast("Reloaded successfully");
    } catch (e) {
      MessageUtil.showToast("Failed to reload");
    }
  }
}
