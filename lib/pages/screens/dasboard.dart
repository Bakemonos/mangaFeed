import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mangafeed/properties.dart';

class Dasboard extends StatefulWidget {
  const Dasboard({super.key});

  @override
  State<Dasboard> createState() => _DasboardState();
}

class _DasboardState extends State<Dasboard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
      child: Column(
        children: [
          SizedBox(
            height: 25.h,
          ),
          Stack(
            children: [
              SizedBox(
                width: screenWidth,
                child: Positioned(
                  top: 0,
                  child: SvgPicture.asset(
                    'assets/Logos/mangaLogo.svg',
                    width: 186.w,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: SvgPicture.asset(
                  'assets/Icons/activeNotif.svg',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              'Discover',
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            color: textFieldStroke,
            height: 1,
            width: screenWidth,
          ),
        ],
      ),
    ));
  }
}
