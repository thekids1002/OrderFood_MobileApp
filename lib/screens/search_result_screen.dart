import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orderfood1/services/product_services.dart';
import 'package:orderfood1/utils/message_util.dart';

import '../models/product.dart';
import '../widgets/rounded_image.dart';

class SearchResultBody extends StatefulWidget {
  const SearchResultBody({super.key});

  @override
  State<SearchResultBody> createState() => _SearchResultBodyState();
}

class SearchResultScreen extends StatefulWidget {
  final String initialSearch;
  const SearchResultScreen({
    super.key,
    required this.initialSearch,
  });

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class TabItem extends StatelessWidget {
  final Product product;

  const TabItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
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
          SizedBox(
            width: 220,
            child: Column(
              children: [
                Center(
                  child: RoundedImage(
                    imagePath: product.imagePath,
                    width: 150,
                    height: 150,
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    product.name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "SF-PRO",
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    product.price,
                    style: const TextStyle(
                        color: Color(0xFFFA4A0C),
                        fontFamily: "SF-PRO",
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
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

class _SearchResultScreenState extends State<SearchResultScreen> {
  late TextEditingController _searchController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEEEEEE),
        appBar: AppBar(
          backgroundColor: const Color(0xFFEEEEEE),
          title: TextFormField(
            controller: _searchController,
            textAlign: TextAlign.start,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: Colors.black.withOpacity(0.9),
              fontFamily: "SF-PRO",
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset("assets/icons/back-button.svg"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: const SearchResultBody(),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.initialSearch);
  }
}
