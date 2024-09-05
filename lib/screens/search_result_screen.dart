import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orderfood1/utils/message_util.dart';

import '../models/product.dart';
import '../widgets/rounded_image.dart';

class SearchResultScreen extends StatefulWidget {
  final String initialSearch;
  const SearchResultScreen({
    super.key,
    required this.initialSearch,
  });

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  late TextEditingController _searchController;
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.initialSearch);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
}

class SearchResultBody extends StatefulWidget {
  const SearchResultBody({super.key});

  @override
  State<SearchResultBody> createState() => _SearchResultBodyState();
}

class _SearchResultBodyState extends State<SearchResultBody> {
  late List<Product> products = [
    Product(
      imagePath: "assets/images/image_21.png",
      name: "Veggie Tomato Mix",
      price: "N1,900",
    ),
    Product(
      imagePath: "assets/images/image_22.png",
      name: "Organic Carrot Blend",
      price: "N2,200",
    ),
    Product(
      imagePath: "assets/images/image_23.png",
      name: "Fresh Spinach Pack",
      price: "N1,500",
    ),
    Product(
      imagePath: "assets/images/image_24.png",
      name: "Herbal Lettuce",
      price: "N1,800",
    ),
    Product(
      imagePath: "assets/images/image_24.png",
      name: "Green Pepper Mix",
      price: "N2,000",
    ),
    Product(
      imagePath: "assets/images/image_22.png",
      name: "Tomato Basil Combo",
      price: "N2,100",
    ),
  ];

  Future<void> _refresh() async {
    // Simulate a network call or data fetching
    await Future.delayed(const Duration(seconds: 2));

    // Create a new list of products (simulate updated data)
    final List<Product> updatedProducts = [
      Product(
        imagePath: "assets/images/image_21.png",
        name: "Sweet Corn",
        price: "N2,300",
      ),
      Product(
        imagePath: "assets/images/image_22.png",
        name: "Red Bell Pepper",
        price: "N2,100",
      ),
      Product(
        imagePath: "assets/images/image_23.png",
        name: "Arugula Leaves",
        price: "N1,700",
      ),
      Product(
        imagePath: "assets/images/image_24.png",
        name: "Zucchini",
        price: "N1,600",
      ),
      Product(
        imagePath: "assets/images/image_24.png",
        name: "Cherry Tomatoes",
        price: "N2,200",
      ),
      Product(
        imagePath: "assets/images/image_23.png",
        name: "Baby Spinach",
        price: "N1,800",
      ),
    ];

    setState(() {
      products.clear();
      products.addAll(updatedProducts);
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  const Padding(
                    padding: EdgeInsets.all(25),
                    child: Text(
                      "Found 6 results",
                      style: TextStyle(
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
                          onTap: () =>
                              {MessageUtil.showToast(products[index].name)},
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
