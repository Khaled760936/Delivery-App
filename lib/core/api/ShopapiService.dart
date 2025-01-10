import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test/Components/my_shop.dart';

class ShopApiService {

  Future<List<Shop>> getShops(String endpoint) async {
    final url = Uri.parse('${ApiConfig.baseUrl}$endpoint');
    final defaultHeaders = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ApiConfig.token}',
    };

    try {
      final response = await http.get(url, headers: defaultHeaders);
      print('Request URL: $url');
      print('Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        // Parse the response body
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> storesJson = data['stores'];

        // Convert JSON to a list of Shop objects
        final List<Shop> shops =
            storesJson.map((shopJson) => Shop.fromJson(shopJson)).toList();

        return shops;
      } else {
        throw Exception('Failed to fetch shops. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during GET request: $e');
      rethrow;
    }
  }
}

class ApiConfig {
  static const String baseUrl = 'https://ivory-crane-814041.hostingersite.com/api/';
    static const String token = '21|KorJyN3ECmdYQcYa1z7XbzJMHTFrB6gHjV0O6el004c72dee';

}
