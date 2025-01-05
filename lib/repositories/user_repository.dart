import 'package:test/cache/cacheHelper.dart';
import 'package:test/core/api/api_consumer.dart';
import 'package:test/core/api/end_points.dart';
import 'package:test/core/errors/exceptions.dart';
import 'package:test/models/sign_in_model.dart';
import 'package:dartz/dartz.dart';
import 'package:test/models/sign_up_model.dart';

class UserRepository {
  final ApiConsumer api;

  UserRepository({required this.api});
  Future<Either<String, SignInModel>> signIn(
      {required String phoneNumber, required String password}) async {
    try {
      final response = await api.post(EndPoint.signIn,
          data: {ApiKey.phoneNumber: phoneNumber, ApiKey.password: password});
      final signInModel = SignInModel.fromJson(response);
     // CacheHelper().saveData(key: ApiKey.token, value: signInModel.token);
     CacheHelper().saveData(key: ApiKey.token,value:signInModel.user);
      return Right(signInModel);
    } on ServerException catch (e) {
      return left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, SignUpModel>> signUp(
      {required String firstName,
      required String lastName,
      required String phoneNumber,
      required String password}) async {
    try {
      final response = await api.post(EndPoint.signUp, data: {
        ApiKey.firstName: firstName,
        ApiKey.lastName: lastName,
        ApiKey.phoneNumber: phoneNumber,
        ApiKey.password: password,
      });
      final signUpModel = SignUpModel.fromJson(response);
      CacheHelper().saveData(key: ApiKey.token, value: signUpModel.token);
      return Right(signUpModel);
    } on ServerException catch (e) {
      return left(e.errorModel.errorMessage);
    }
  }
}
