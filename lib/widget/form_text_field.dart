import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  final String title;
  final String bio;

  const CustomFormTextField({
    Key? key,
    required this.title,
    required this.bio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 270, // Đặt kích thước chiều ngang của Container
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "$bio",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
