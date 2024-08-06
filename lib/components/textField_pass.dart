import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mangafeed/properties.dart';

class MyTextFieldPass extends StatefulWidget {
  final String textLabel;

  const MyTextFieldPass({
    super.key,
    required this.textLabel,
  });

  @override
  State<MyTextFieldPass> createState() => _MyTextFieldPassState();
}

class _MyTextFieldPassState extends State<MyTextFieldPass> {
  @override
  Widget build(BuildContext context) {
    bool obscureText = true;

    void togglePasswordVisibility() {
      setState(() {
        obscureText = !obscureText;
      });
    }

    return TextField(
      obscureText: obscureText,
      style: TextStyle(
          fontSize: 13.sp, fontFamily: "Poppins", color: textSubtitle),
      decoration: InputDecoration(
        // SHOW PAS

        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: togglePasswordVisibility,
        ),
        // SHOW PASS END
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
    );
  }
}
