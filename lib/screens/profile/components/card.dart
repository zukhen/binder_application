import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Color? iconColor;
  final VoidCallback? onTap;
  const CustomCard({
    Key? key,
    required this.icon,
    required this.title,
    this.subtitle,
    required this.iconColor,required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(140, 140, 140, 0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          width: 110,
          height: 115,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 32,
                    color: iconColor,
                  ),
                  SizedBox(height: 6),
                  Text(
                    textAlign: TextAlign.center,
                    title,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 3),
                  Text(
                    subtitle??"",
                    style: TextStyle(
                      color: iconColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
