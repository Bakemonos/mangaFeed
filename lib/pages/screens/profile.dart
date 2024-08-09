import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mangafeed/components/cards.dart';
import 'package:mangafeed/components/text.dart';
import 'package:mangafeed/properties.dart';
import 'package:mangafeed/services/auth.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Profile> {
  final User? user = AuthService().currentUser;

  // Future<void> signOut() async {
  //   await AuthService().signOut();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 350.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: fadeColor.withOpacity(0.9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.r),
                    bottomRight: Radius.circular(30.r))),
          ),
          Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'My Profile',
                          style:
                              TextStyle(fontSize: 20.sp, fontFamily: "Poppins"),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset('assets/Icons/menu.svg')),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 50.0,
                      // Customize button color
                      backgroundImage: AssetImage('assets/Images/todoroki.png'),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Rico Jay',
                          font: "Poppins",
                          size: 20,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                        MyText(
                          text: '@Bakemono',
                          font: "Poppins",
                          size: 15,
                          fontWeight: FontWeight.w400,
                          color: textSubtitle,
                        ),
                        MyText(
                          text: 'San Basya, CA',
                          font: "Poppins",
                          size: 15,
                          fontWeight: FontWeight.w400,
                          color: textSubtitle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: const MyCards(),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
