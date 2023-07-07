import 'package:binder_application/screens/profile/components/card.dart';
import 'package:binder_application/screens/profile/components/dialog_buying.dart';
import 'package:binder_application/screens/profile/edit_profile.dart';
import 'package:flutter/material.dart';

import 'client/base_client_profile.dart';
import 'components/slider.dart';

class ProfileScreen extends StatefulWidget {
  final String email;

  const ProfileScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _baseClient = ClientProfileAuth();
  String? fullName;

  void _getDataUser() async {
    final userData = await _baseClient.getFullName(widget.email);
    final part = userData.toString().split("|");
    final username = part[0];
    setState(() {
      fullName = username;
    });
    print('>>>>>>>>>>>>>>>>>>>>>$fullName');
  }

  void _showDialog(String title, IconData iconData, Color iconColor) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogBuying(
          iconColor: iconColor,
          title: title,
          iconData: iconData,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _getDataUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 135,
                      height: 135,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: Image.network(
                          'https://scontent.fhan5-11.fna.fbcdn.net/v/t39.30808-6/347446281_259187106633556_1010085402379612361_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=yZmuW1UXW04AX-basqs&_nc_ht=scontent.fhan5-11.fna&oh=00_AfAUcDHFpp7So7mmB7O-2eOo3dQtX35grA5R5Qnf69eL6A&oe=647FD592',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          width: 40,
                          height: 40,
                          color: Colors.purple,
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditProfile(
                                    fullName: '$fullName',
                                    email: widget.email,
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  '$fullName',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomCard(
                        onTap: () => _showDialog("Super like", Icons.star, Colors.blue),
                        iconColor: Colors.blue,
                        icon: Icons.star,
                        title: 'Get 5 Super Like',
                        subtitle: "Buy",
                      ),
                    ),
                    Expanded(
                      child: CustomCard(
                        onTap: () => _showDialog("Higher Speed", Icons.bolt, Colors.red),
                        iconColor: Colors.red,
                        icon: Icons.bolt,
                        title: 'Get Higher Speed',
                        subtitle: "Buy",
                      ),
                    ),
                    Expanded(
                      child: CustomCard(
                        onTap: () => _showDialog("Binder Gold", Icons.ac_unit_outlined, Colors.green),
                        icon: Icons.ac_unit_outlined,
                        title: "Binder Gold",
                        iconColor: Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                SliderCustom(),
              ],
            ),
        ),
      ),
    );
  }
}
