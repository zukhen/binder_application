import 'package:flutter/material.dart';

import '../home/home_screen_login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _navigateScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) =>  const HomeScreenLogin()));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateScreen(context);
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
            margin: const EdgeInsets.only(top: 250),
            child: const Align(
              alignment: FractionalOffset.topCenter,
              child: Text(
                "Binder",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
