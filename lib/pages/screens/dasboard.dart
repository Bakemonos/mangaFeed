import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mangafeed/components/friendIcon.dart';
import 'package:mangafeed/components/friendPost.dart';
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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          toolbarHeight: 80.h,
          title: SvgPicture.asset(
            'assets/Logos/mangaLogo.svg',
            width: 186.w,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: SvgPicture.asset(
                width: 24.w,
                'assets/Icons/activeNotif.svg',
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
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
              SizedBox(
                height: 10.h,
              ),
              const FriendsList(),
              const MyFriendPost(),
            ],
          ),
        ));
  }
}
