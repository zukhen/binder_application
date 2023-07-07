import 'package:binder_application/screens/auth/client/base_client.dart';
import 'package:binder_application/screens/auth/login.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _showPasswords = false;
  bool _showRePasswords = false;
  String? _eFullName, _errorEmail, _errorPassword, _errorRePassword;
  final _emailController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();
  final _baseClient = AuthService();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
  }

  void _validateForm() async {
    final email = _emailController.text;
    final pwd = _passwordController.text;
    final rePwd = _rePasswordController.text;
    setState(() {
      _eFullName =
          _fullNameController.text.isEmpty ? "Vui lòng nhập tên đầy đủ" : null;
      _errorEmail = email.isEmpty ? "Vui lòng nhập email" : null;
      _errorPassword = pwd.isEmpty ? "Vui lòng nhập mật khẩu" : null;
      _errorRePassword = pwd != rePwd ? "Mật khẩu không khớp" : null;
    });

    if (_eFullName == null &&
        _errorEmail == null &&
        _errorPassword == null &&
        _errorRePassword == null) {
      await _baseClient.createUserWithEmailAndPassWord(
          email, pwd, _fullNameController.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Create your\naccount",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                ),
                const SizedBox(
                  height: 20,

                ),
                TextField(
                  onChanged: (value) {},
                  controller: _emailController,
                  decoration: InputDecoration(
                    errorText: _errorEmail,
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Theme.of(context).hintColor.withOpacity(0.03),
                    filled: true,
                    prefixIconColor: Colors.grey,
                    prefixIcon: const Icon(Icons.email),
                  ),
                ),
                const SizedBox(
                  height: 20,

                ),
                TextField(
                  onChanged: (value) {},
                  controller: _fullNameController,
                  decoration: InputDecoration(
                    errorText: _eFullName,
                    hintText: "Full name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Theme.of(context).hintColor.withOpacity(0.03),
                    filled: true,
                    prefixIconColor: Colors.grey,
                    prefixIcon: const Icon(Icons.person),
                  ),
                ),
                const SizedBox(
                  height: 20,

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
                  height: 20,
                ),
                TextField(
                  controller: _rePasswordController,
                  obscureText: !_showRePasswords,
                  decoration: InputDecoration(
                    errorText: _errorRePassword,
                    hintText: "Re-Password",
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
                          _showRePasswords = !_showRePasswords;
                        });
                      },
                      icon: _showRePasswords
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                  ),
                ),
                const SizedBox(height: 50,),
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
      ),
    );
  }
}
