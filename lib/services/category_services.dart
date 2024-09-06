import '../models/category.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryServices {
  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/thekids1002/OrderFood_MobileApp/feature/api_sample/home_screen_tabs_list.json'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
