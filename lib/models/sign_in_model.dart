import 'package:test/Components/my_user.dart';
import 'package:test/core/api/end_points.dart';

class SignInModel {
  final String message;
  final User user ;
  SignInModel({required this.message, required this.user});

  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(
        message: jsonData[ApiKey.message], user: jsonData[ApiKey.user]);
  }
}
