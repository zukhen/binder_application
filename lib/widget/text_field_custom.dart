import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? errorText;
  final String? hintText;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final Color? fillColor;
  final Color? prefixIconColor;
  final Widget? prefixIcon;

  const CustomTextField({
    Key? key,
    required this.errorText,
    required this.hintText,
    required this.controller,
    required this.onChanged,
    this.fillColor,
    this.prefixIconColor,
    required  this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        errorText: errorText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        fillColor: fillColor ?? Theme.of(context).hintColor.withOpacity(0.03),
        filled: true,
        prefixIconColor: prefixIconColor,
        prefixIcon: prefixIcon,
      ),
    );
  }
}


