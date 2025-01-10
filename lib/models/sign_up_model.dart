import 'package:test/classes/UserService2.dart';
import 'package:test/core/api/end_points.dart';

class SignUpModel {
  final String message;
  final String token;
  final UserService2 user;
  SignUpModel(
      {required this.message, required this.token, required this.user});
  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(
      user: UserService2.fromJson(jsonData[ApiKey.user]),
        message: jsonData[ApiKey.message],
        token: jsonData[ApiKey.token]);

  }
}
