import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mangafeed/properties.dart';

class MyButton extends StatelessWidget {
  final Function() onPressed;
  final String textButton;

  const MyButton({
    super.key,
    required this.textButton,
    required this.onPressed,
  });
 
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 48.h,
      width: screenWidth.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: primarColor,
          foregroundColor: textLight,
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontFamily: "Poppins",
          ),
          elevation: 5,
          shadowColor: textFieldStroke,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r), // Rounded corners
          ),
        ),
        child: Text(
          textButton,
          style: TextStyle(
            color: textLight,
            fontSize: 16.sp,
            fontFamily: "Poppins",
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
