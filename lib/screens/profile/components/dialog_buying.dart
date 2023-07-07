import 'package:flutter/material.dart';

class DialogBuying extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color iconColor;

  const DialogBuying({Key? key,required  this.title, required this.iconData,required this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dialog(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 250,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(80)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      width: 70,
                      height: 70,
                      color: const Color.fromRGBO(162, 159, 159, 0.3),
                      child: Icon(
                        iconData,
                        color: iconColor,
                        size: 42,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "$title makes you stand out more",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: iconColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "3x likely to find the right person!",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: iconColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20),
                        child: Text(
                          "Buying with 10\$",
                          style: TextStyle(fontSize: 18 ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
