import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test/Components/my_items_list.dart';
import 'package:test/Components/my_shop_list.dart';
import 'package:test/cache/cacheHelper.dart';
import 'package:test/core/api/ShopapiService.dart';
import 'package:test/core/api/all_items_service.dart';
import 'package:test/core/api/dio_consumer.dart';
import 'package:test/cubit/User_cubit.dart';
import 'package:test/repositories/user_repository.dart';
import 'package:test/screens/homePage.dart';
import 'package:test/screens/loginPage.dart';
import 'package:test/screens/SignUp.dart';
import 'package:test/screens/splash.dart';
import 'package:test/themes/themeProvider.dart';

Future<void> main() async {
  final apiService = ShopApiService();
  final endpoint = 'stores/all';

  try {
    shops = await apiService.getShops(endpoint);
  } catch (e) {
    print('Error fetching shops: $e');
  }

  final AllapiService = AllProductApiService();

  try {
    allItems = await AllapiService.fetchProducts();
  } catch (e) {
    print('sorry: $e');
  }
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
      BlocProvider(
        create: (context) =>
            UserCubit(UserRepository(api: DioConsumer(dio: Dio()))),
      ),
    ],
    child: const MyApp(),
  ));
  // final aa = await apiService.get('stores/all');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      initialRoute: "/LoginPage",
      routes: {
        "/SplashScreen": (context) => const SplashScreen(),
        "/LoginPage": (context) => const LoginPage(),
        "/SignUp": (context) => const SignUp(),
        "/HomePage": (context) => const HomePage(),
      },
    );
  }
}
