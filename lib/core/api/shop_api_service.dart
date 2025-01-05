import 'dart:convert';

import 'package:test/core/api/apiService.dart';
import 'package:test/models/shop_model.dart';
import 'package:test/models/shops_model.dart';

class ShopApiService {
  final ApiService _apiService = ApiService();

  Future<List<Shop>> fetchShops() async {
    try {
      final response = await _apiService.get('stores/all');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final shops = Shops.fromJson(data);
        return shops.shops.map((e) => Shop.fromJson(e)).toList();
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized: Check your token or permissions');
      } else {
        print('Status code = ${response.statusCode}');
        throw Exception(
            'Failed to load shops, status code: ${response.statusCode}');
      }
    } catch (ex) {
      print('Error fetching shops: $ex');
      throw Exception('Failed to fetch shops');
    }
  }
}
