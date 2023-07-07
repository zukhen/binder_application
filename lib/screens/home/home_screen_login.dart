import 'package:binder_application/screens/auth/OTP/add_phone_numbers.dart';
import 'package:binder_application/screens/auth/login.dart';
import 'package:binder_application/screens/auth/register.dart';
import 'package:binder_application/widget/button_custom.dart';
import 'package:flutter/material.dart';

import '../auth/client/base_client.dart';

class HomeScreenLogin extends StatefulWidget {
  const HomeScreenLogin({Key? key}) : super(key: key);

  @override
  State<HomeScreenLogin> createState() => _HomeScreenLoginState();
}

class _HomeScreenLoginState extends State<HomeScreenLogin> {
  final _baseClient = AuthService();

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Notification'),
          content: Text('The function is in development!'),
        );
      },
    );
  }

  void _loginWithGoogle() async {
    final user = await _baseClient.signUpWithGoogle();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddPhoneNumbers(
                  username: 'name',
                  email: 'email',
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/untitled.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 250),
            child: const Text(
              "Binder",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonCustom(
                    text: "Sign in with google",
                    image: "icons/google.png",
                    onPressed: _loginWithGoogle),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: ButtonCustom(
                      text: "Sign in with facebook",
                      image: "icons/facebook.png",
                      onPressed: _showDialog),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: const Text("Continue with Email",
                      style: TextStyle(color: Colors.white, fontSize: 17)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Dont have account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterScreen()));
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
