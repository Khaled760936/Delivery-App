import 'package:http/http.dart' as http;
import 'package:test/Components/my_item.dart';
import 'dart:convert';

import 'package:test/core/api/ShopapiService.dart';

class AllProductApiService {
  Future<List<Item>> fetchProducts() async {
    final url = Uri.parse(
        'https://ivory-crane-814041.hostingersite.com/api/products/all');
    final defaultHeaders = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ApiConfig.token}',
    };

    try {
      final response = await http.get(url, headers: defaultHeaders);
      print('Request URL: $url');
      print('Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> allproductsJson = data['stores'];

        // Convert JSON to a list of Item objects
        final List<Item> allproducts =
            allproductsJson.map((productJson) => Item.fromJson(productJson)).toList();

        return allproducts;
      } else {
        throw Exception('Failed to fetch products. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during GET request: $e');
      rethrow;
    }
  }
}
