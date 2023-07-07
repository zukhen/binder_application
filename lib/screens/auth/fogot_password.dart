import 'package:binder_application/screens/auth/client/base_client.dart';
import 'package:flutter/material.dart';

import '../../widget/text_field_custom.dart';

class FogotPasswordScreen extends StatefulWidget {
  const FogotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<FogotPasswordScreen> createState() => _FogotPasswordScreenState();
}

class _FogotPasswordScreenState extends State<FogotPasswordScreen> {
  String? _errorEmail;
  final _emailController = TextEditingController();
  final _baseClient = AuthService();

  void _validateForm() async {
    final email =  _emailController.text.trim();
    setState(() {
      _errorEmail =
      email .isEmpty ? "Vui lòng nhập email" : null;
    });
    if (_errorEmail == null) {
     await _baseClient.fogotPassword(email);
     Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.2,
        leading: IconButton(
          icon: const Icon(
            Icons.west,
            color: Colors.black,
            size: 42,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Fogot Password?",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                        "If you need help to resetting your password, we can help\nby sending you a link to reset it"),
                  ],
                )),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(
                      errorText: _errorEmail,
                      hintText: "Enter your email to reset password",
                      controller: _emailController,
                      prefixIconColor: Colors.grey,
                      onChanged: (value) {},
                      prefixIcon: const Icon(Icons.email)),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: _validateForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(25), // Thiết lập radius là 25
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 40.0 / 2.7),
                      child: Text(
                        "Reset Password",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
