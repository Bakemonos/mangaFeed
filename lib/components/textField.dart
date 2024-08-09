import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mangafeed/properties.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String textLabel;

  const MyTextField(
      {super.key, required this.textLabel, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      controller: controller,
      style: TextStyle(
          fontSize: 13.sp, fontFamily: "Poppins", color: textSubtitle),
      decoration: InputDecoration(
        labelText: textLabel,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
          borderSide: const BorderSide(color: textFieldStroke),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: textFieldStroke),
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
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
    );
  }
}
