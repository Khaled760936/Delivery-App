import 'package:http/http.dart' as http;
import 'package:test/Components/my_item.dart';
import 'dart:convert';

import 'package:test/core/api/ShopapiService.dart';

class ProductApiService {
  Future<List<Item>> fetchProducts(int storeId) async {
    final url = Uri.parse(
        'https://ivory-crane-814041.hostingersite.com/api/stores/$storeId/products');
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
        final List<dynamic> productsJson = data['products'];

        // Convert JSON to a list of Item objects
        final List<Item> products =
            productsJson.map((productJson) => Item.fromJson(productJson)).toList();

        return products;
      } else {
        throw Exception('Failed to fetch products. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during GET request: $e');
      rethrow;
    }
  }
}
