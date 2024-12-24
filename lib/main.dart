import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/cache/cacheHelper.dart';
import 'package:test/core/api/dio_consumer.dart';
import 'package:test/cubit/User_cubit.dart';
import 'package:test/repositories/user_repository.dart';
import 'package:test/screens/loginPage.dart';
import 'package:test/screens/SignUp.dart';
import 'package:test/screens/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(BlocProvider(
      create: (context) =>
          UserCubit(UserRepository(api: DioConsumer(dio: Dio()))),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/SplashScreen",
        routes: {
          "/SplashScreen": (context) => const SplashScreen(),
          "/LoginPage": (context) => const LoginPage(),
          "/SignUp": (context) => const SignUp(),
        });
  }
}
