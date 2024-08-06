import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mangafeed/properties.dart';

class MyButton extends StatefulWidget {
  final String textButton;
  final Widget destinationScreen;

  const MyButton(
      {super.key, required this.textButton, required this.destinationScreen});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 48.h,
      width: screenWidth.w,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => widget.destinationScreen,
            ),
          );
        },
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
          widget.textButton,
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
