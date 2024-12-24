import 'package:flutter/material.dart';
import 'dart:async';

import 'package:test/screens/loginPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 176, 255),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Image.asset('lib/assets/images/photo_2024-11-28_10-17-14.jpg',
              height: 250, width: 250),
        ),
        const Padding(
          padding: EdgeInsets.all(18.0),
          child: Text(
            'Speedy Deliveries !',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ]),
    );
  }
}
