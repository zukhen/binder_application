import 'package:binder_application/screens/auth/OTP/verify_OTP.dart';
import 'package:flutter/material.dart';

import '../client/base_client.dart';

class AddPhoneNumbers extends StatefulWidget {
  final String username;
  final String email;
  const AddPhoneNumbers({Key? key, required this.username, required this.email}) : super(key: key);

  @override
  State<AddPhoneNumbers> createState() => _AddPhoneNumbersState();
}

class _AddPhoneNumbersState extends State<AddPhoneNumbers> {
  final _phoneNumbersController = TextEditingController();
  final _baseClient = AuthService();
  String? _errorPhoneNumbers;
  void _validateForm() {
    final email = widget.email;
    final phoneNumbers = _phoneNumbersController.text.trim();
    setState(() {
      _errorPhoneNumbers =
          phoneNumbers.isEmpty ? "Vui lòng nhập số điện thoại" : null;
    });
    if (_errorPhoneNumbers == null) {
      final phone = "+84 $phoneNumbers";
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>  VerifyOTP(phone:phone,email: email, )));
    }
  }

  void _backToLogin() {
    _baseClient.logOut();
    Navigator.pop(context);
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
          onPressed: _backToLogin,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Hello ",
                  style: TextStyle(fontSize: 16),
                ),
                Text(widget.username,
                    style: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.bold)),
              ],
            ),
            const Align(
                alignment: Alignment.topLeft,
                child: Text("complete a few steps before use.",
                    style: TextStyle(fontSize: 16))),
            const SizedBox(
              height: 80,
            ),
            TextField(
              controller: _phoneNumbersController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                errorText: _errorPhoneNumbers,
                prefixIcon: const Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Enter your phone numbers ',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: _validateForm,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
