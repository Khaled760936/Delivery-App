import 'dart:convert';
import 'package:http/http.dart' as http;
import 'config.dart';

class ApiService {
  final String token = '11|ZSlWYkehreb0YsJwujhteMP9bjprGh5MGGsVpGBXbd84234c';

  Future<http.Response> get(String endpoint, {Map<String, String>? headers}) async {
    final url = Uri.parse('${ApiConfig.baseUrl}$endpoint');
    final defaultHeaders = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final mergedHeaders = {...?headers, ...defaultHeaders};

    try {
      final response = await http.get(url, headers: mergedHeaders);
      print('Request URL: $url');
      print('Request Headers: $mergedHeaders');
      return response;
    } catch (e) {
      print('Error during GET request: $e');
      rethrow;
    }
  }

  // يمكنك إضافة باقي الطرق مثل POST, PUT, DELETE بنفس الطريقة
}
class ApiConfig {
  static const String baseUrl = 'http://ivory-crane-814041.hostingersite.com/api/';
}