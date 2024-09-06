import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';

class ProductServices {
  Future<List<Product>> fetchProducts() async {
    const url =
        'https://raw.githubusercontent.com/thekids1002/OrderFood_MobileApp/feature/api_sample/product_list.json';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Chuyển đổi JSON thành danh sách Product
        List<dynamic> jsonData = jsonDecode(response.body);
        List<Product> products =
            jsonData.map((item) => Product.fromJson(item)).toList();
        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      return List.empty();
    }
  }

  Future<List<Product>> fetchProductsByCategoryId(int tabId) async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/thekids1002/OrderFood_MobileApp/feature/api_sample/get_product_by_tab_id.json'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
        List<Product> products =
            jsonData.map((item) => Product.fromJson(item)).toList();
        return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
