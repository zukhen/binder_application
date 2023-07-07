import 'package:binder_application/screens/auth/client/base_client.dart';
import 'package:binder_application/screens/chatting/chatting_screen.dart';
import 'package:binder_application/screens/confirm/confirm_screen.dart';
import 'package:binder_application/screens/home/components/body.dart';
import 'package:binder_application/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import '../auth/login.dart';


class HomeScreen extends StatefulWidget {
  final String email;

  const HomeScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  final _baseClient = AuthService();

  void _getDataUser() async {
    final userData = await _baseClient.getDataUser(widget.email);
    final part = userData.toString().split("|");
    final userID = part[1];
    final phone = part[0];
    if (phone.isEmpty) {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmProfileScreen(userID: userID),
        ),
      );
    }
  }


  void _logOut()async{
    await _baseClient.logOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDataUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(
          Icons.ac_unit_outlined,
          color: Colors.purple,
        ),
        actions: [
          Text(widget.email),
          IconButton(
              onPressed: _logOut,
              icon: const Icon(
                Icons.logout,
                color: Colors.purple,
              ))
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          const ChattingScreen(),
          const Body(),
          ProfileScreen(email: widget.email),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
