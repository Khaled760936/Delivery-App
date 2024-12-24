import 'package:test/core/api/end_points.dart';

class SignUpModel {
  final String message;
  final String token;
  SignUpModel({required this.message, required this.token});
  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(
        message: jsonData[ApiKey.message], token: jsonData[ApiKey.token]);
  }
}
