import 'dart:async';

import 'package:binder_application/screens/auth/client/base_client.dart';
import 'package:binder_application/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class VerifyOTP extends StatefulWidget {
  final String phone;
  final String email;

  const VerifyOTP({
    Key? key,
    required this.phone,
    required this.email,
  }) : super(key: key);

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  @override
  void initState() {
    super.initState();
     _baseClient.phoneAuth(widget.phone);
    countDownOTP();
  }

  final _baseClient = AuthService();
  String? otp;
  bool canResend = false;
  int countdown = 60;
  late Timer _timer;
  List<TextEditingController> otpControllers =
      List.generate(6, (index) => TextEditingController());

  void countDownOTP() {
    canResend = false;
    countdown = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        countdown--;
        if (countdown == 0) {
          canResend = true;
          _baseClient.phoneAuth(widget.phone);

          _timer.cancel();
        }
      });

    });
  }

  void _verifyOTP() async {
    final email = widget.email;
    String otp = '';
    for (TextEditingController controller in otpControllers) {
      otp += controller.text;
    }
    if (otp.isEmpty) {
      buildDialog("Please enter the OTP.");
      return;
    }
    bool isValid = await _baseClient.verifyOTP(otp);
    if (isValid) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(
                  email: email,
                )),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
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
        body: Container(
          margin:
              const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Enter 6 digit code",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text("Your code was sent to ${widget.phone}"),
                    ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOTPFields(),
                ],
              ),
              TextButton(
                onPressed: canResend ? () => countDownOTP() : null,
                child: Text(
                  canResend ? "Resend code" : "Resend in $countdown seconds",
                ),
              ),
              ElevatedButton(
                onPressed: _verifyOTP,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Verify",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildOTPFields() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int i = 0; i < 6; i++)
            SizedBox(
              width: 55.0,
              child: TextField(
                controller: otpControllers[i],
                keyboardType: TextInputType.number,
                maxLength: 1,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20.0),
                decoration: InputDecoration(
                  counterText: '',
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onChanged: (value) {
                  if (value.length == 1 && i < 5) {
                    FocusScope.of(context).nextFocus();
                  } else if (value.isEmpty && i > 0) {
                    FocusScope.of(context).previousFocus();
                  }
                },
              ),
            ),
        ],
      ),
    );
  }

  void buildDialog(String error) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(error),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
