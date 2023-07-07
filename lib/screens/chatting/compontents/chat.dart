import 'package:flutter/material.dart';

import '../../../models/users.dart';

class Chatting extends StatelessWidget {
  final User user;

  const Chatting({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(textAlign: TextAlign.center,"This is a chatting screen\n Không đủ thời gian nên không làm"),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.video_call,
                color: Colors.black,
              ))
        ],
        title: Align(
          alignment: Alignment.center,
          child: Text(
            user.name,
            style: const TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        elevation: 0.2,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.west,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
