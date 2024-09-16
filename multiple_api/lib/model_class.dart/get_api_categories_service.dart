import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:multiple_api/model_class.dart/get_api_categories_model.dart';

class CategoryDetailService {
  static const String _baseUrl = 'https://dummyjson.com/products/categories';

  Future<List<CategoryDetailModel>> fetchCategories() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => CategoryDetailModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception('Error fetching categories: $e');
    }
  }
}
