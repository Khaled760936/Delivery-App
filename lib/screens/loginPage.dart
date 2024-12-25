import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/cubit/User_cubit.dart';
import 'package:test/cubit/User_state.dart';
import 'package:test/screens/SignUp.dart';
import 'package:test/screens/homePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<UserCubit, UserState>(
          listener: (context, Object? state) {
        if (state is SignInSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        } else if (state is SignInFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      }, builder: (context, state) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 7, 176, 255),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'lib/assets/images/photo_2024-11-21_11-19-15.jpg',
                    width: 300,
                    height: 300,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Log in to start your journy',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Pacifico')),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone_android),
                      hintText: 'phone Number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    obscureText: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.remove_red_eye_outlined),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: state is SignInLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {
                              context.read<UserCubit>().signIn();
                            },
                            child: const Text('Login',
                                style: TextStyle(color: Colors.white)))),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                  child: const Text('Don’t have an Account ! Sign up',
                      style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
