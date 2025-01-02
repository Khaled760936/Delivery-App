import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test/models/shop_model.dart';
import 'package:test/models/shops_model.dart';

class ShopApiService {
  final String ApiKey = 'stores/all';

  Future<List<Shop>> fetchShops() async {
    try {
      final response = await http.get(
        Uri.parse('http://ivory-crane-814041.hostingersite.com/api/stores/all'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer 9|Se3z7Ygv4Cuj25FegZjYduPRoDUyGqn2AI07t8MU29c853ef', // Update if needed
        },
      );
print('Request Headers: ${response.request?.headers}');
print('Request URL: ${response.request?.url}');

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
