import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mangafeed/properties.dart';

class MyTextFieldPass extends StatefulWidget {
  final TextEditingController? controller;
  final String textLabel;
  final String? Function(String?)? validator; // Add validator parameter

  const MyTextFieldPass({
    super.key,
    required this.textLabel,
    required this.controller,
    this.validator, // Initialize validator parameter
  });

  @override
  State<MyTextFieldPass> createState() => _MyTextFieldPassState();
}

class _MyTextFieldPassState extends State<MyTextFieldPass> {
  bool obscureText = true; // Move obscureText to the state class

  void togglePasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscureText,
      style: TextStyle(
          fontSize: 13.sp, fontFamily: "Poppins", color: textSubtitle),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
            color: textSubtitle,
          ),
          onPressed: togglePasswordVisibility,
        ),
        labelText: widget.textLabel,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
          borderSide: const BorderSide(color: textFieldStroke),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
          borderSide: const BorderSide(color: primarColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
      ),
      validator: widget.validator, // Use validator here
    );
  }
}
