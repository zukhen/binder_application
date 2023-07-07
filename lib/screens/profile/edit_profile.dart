import 'package:binder_application/screens/profile/client/base_client_profile.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../widget/form_text_field.dart';

class EditProfile extends StatefulWidget {
  final String fullName;
  final String email;

  const EditProfile({Key? key, required this.fullName, required this.email})
      : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _baseClient = ClientProfileAuth();
  String? bio, gender, email, phone, avatar;

  void _showDialogGender() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text('Choose your gender'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      gender = "Male";
                    });
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Male",
                    style: TextStyle(color: Colors.purple),
                  )),
              TextButton(
                  onPressed: () {
                    setState(() {
                      gender = "Female";
                    });
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Female",
                    style: TextStyle(color: Colors.purple),
                  )),
            ],
          ),
        );
      },
    );
  }

  void _openImagePicker() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'jpeg'],
    );
    if (result == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("No file selected")));
      return null;
    }
  }

  void _queryData() async {
    final query = await _baseClient.getFullData(widget.email);
    setState(() {
      avatar = query["avatar"];
      bio = query["bio"] ?? "Please update your biography";
      gender = query["gender"];
      email = query["email"];

      phone = query["phone"]?.replaceAll(RegExp(r'^\+?84?0*'), '');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _queryData();
    print(avatar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            "Edit Profile",
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Finish",
              ))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                            onPressed: _openImagePicker,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${widget.fullName}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomFormTextField(
                  title: "Biography",
                  bio: "$bio",
                ),
                CustomFormTextField(
                  title: "Phone",
                  bio: "$phone",
                ),
                CustomFormTextField(
                  title: "Email",
                  bio: "$email",
                ),
                textCustom(title: "Gender", bio: "$gender"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textCustom({required String title, required String bio}) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 45),
                child: TextButton(
                  onPressed: _showDialogGender,
                  child: Text(bio),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
