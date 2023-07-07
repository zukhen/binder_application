import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final String? text;
  final String? image;
  final VoidCallback? onPressed;
  final Color? color;

  const ButtonCustom(
      {Key? key,
      required this.text,
       this.image,
      required this.onPressed,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/$image'),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                text ?? "null",
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ],
        ));
  }
}
