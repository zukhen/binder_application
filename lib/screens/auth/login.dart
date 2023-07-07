import 'package:binder_application/screens/auth/fogot_password.dart';
import 'package:binder_application/widget/text_field_custom.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import 'client/base_client.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPasswords = false;

  String? _errorEmail, _errorPassword;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _baseClient = AuthService();

  void _validateForm() async {
    final email = _emailController.text;
    final pwd = _passwordController.text;
    setState(() {
      _errorEmail = email.isEmpty ? "Vui lòng nhập email" : null;
      _errorPassword = pwd.isEmpty ? "Vui lòng nhập mật khẩu" : null;
    });

    if (_errorEmail == null && _errorPassword == null) {
      await _baseClient.signInWithEmailAndPassword(email, pwd);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) =>  HomeScreen(email: email,)));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Login to your\naccount",
                style: TextStyle(
                    fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 2),
              ),
              const SizedBox(
                height: 60,
              ),
              CustomTextField(
                  errorText: _errorEmail,
                  hintText: "binder@gmail.com",
                  controller: _emailController,
                  prefixIconColor: Colors.grey,
                  onChanged: (value) {},
                  prefixIcon: const Icon(Icons.email)),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: _passwordController,
                obscureText: _showPasswords ? false : true,
                decoration: InputDecoration(
                  errorText: _errorPassword,
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Theme.of(context).hintColor.withOpacity(0.03),
                  filled: true,
                  prefixIconColor: Colors.grey,
                  suffixIconColor: Colors.grey,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _showPasswords = !_showPasswords;
                      });
                    },
                    icon: _showPasswords
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FogotPasswordScreen()));
                  },
                  child: const Text(
                    "Fogot Password?",
                    style: TextStyle(color: Colors.purple),
                  )),
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
                    "Sign up",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
