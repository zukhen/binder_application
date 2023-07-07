import 'package:binder_application/screens/chatting/compontents/buying.dart';
import 'package:binder_application/screens/chatting/compontents/chat.dart';
import 'package:binder_application/screens/chatting/compontents/user_list_card.dart';
import 'package:flutter/material.dart';

import '../../models/users.dart';

class ChattingScreen extends StatefulWidget {
  const ChattingScreen({Key? key}) : super(key: key);

  @override
  State<ChattingScreen> createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> {
  final users = User.users;
  static const title = 'Buy Binder Gold';
  static const color = 0xFF43A047;
  static const subTitle =
      'See Who Likes You and match with them instantly with Binder gold';

  void _changeScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const BuyingBinder(
                  title: title,
                  color: color,
                  subTitle: subTitle,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "New match",
              style: TextStyle(
                fontSize: 15,
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: GestureDetector(
                      onTap: _changeScreen,
                      child: Image.network(
                        'https://media.discordapp.net/attachments/888736793808207903/1114173474408255538/blur.jpg?width=509&height=683',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 110,
                  // Adjust the width based on your layout needs
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return Container(
                        width: 80,
                        height: 80,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                        ),
                        child: ClipOval(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Chatting(user: user)));
                            },
                            child: Image.network(
                              user.imageUrls[0],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Conversation",
              style: TextStyle(
                fontSize: 15,
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return UserCard(user: user);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
