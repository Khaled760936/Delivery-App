import 'package:test/classes/Userservis.dart';
import 'package:test/core/api/end_points.dart';

class SignInModel {
  final String message;
  final UserService user;
  final String token;

  SignInModel({required this.token, required this.message, required this.user});

  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(
        token: jsonData[ApiKey.token],
        message: jsonData[ApiKey.message],
        user: UserService.fromJson(jsonData[ApiKey.user]));
  }
}
