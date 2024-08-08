import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mangafeed/properties.dart';

class MyFriendPost extends StatefulWidget {
  const MyFriendPost({super.key});

  @override
  State<MyFriendPost> createState() => _MyFriendPostState();
}

class _MyFriendPostState extends State<MyFriendPost> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 20.h, left: 25.w, right: 25.w),
              child: Stack(
                children: [
                  SizedBox(
                    height: 420.h,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 400.h,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.r)),
                                border: Border.all(
                                  width: 1,
                                  color: textFieldStroke,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.w, vertical: 5.h),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 40.0,
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                radius: 30.0,
                                                backgroundColor: themeColor,
                                                backgroundImage: AssetImage(
                                                  'assets/Images/todoroki.png',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        const Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Todoroki',
                                                style: TextStyle(
                                                  color: textColor,
                                                  fontFamily: "Poppins",
                                                ),
                                              ),
                                              Text(
                                                '2 hours Ago',
                                                style: TextStyle(
                                                  color: textColor,
                                                  fontFamily: "Poppins",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Icon(
                                          color: textColor,
                                          size: 24.w,
                                          Icons.more_vert,
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'I recommend this manga if you like thriller haha  \nTittle : Tokyo Ghoul',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: textColor,
                                          fontFamily: "Poppins",
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Expanded(
                                      child: Image.asset(
                                          fit: BoxFit.fill,
                                          'assets/Images/post1.png'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: themeColor.withOpacity(0.8),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.r),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                width: 24.w,
                                'assets/Icons/postIcons/heart.svg',
                                color: textLight,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                '52k...',
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: textLight,
                                  fontSize: 14.sp,
                                ),
                              ),
                              const Spacer(
                                flex: 3,
                              ),
                              SvgPicture.asset(
                                width: 24.w,
                                'assets/Icons/postIcons/comments.svg',
                                color: textLight,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                '1.4k...',
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: textLight,
                                  fontSize: 14.sp,
                                ),
                              ),
                              const Spacer(
                                flex: 5,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    width: 20.w,
                                    'assets/Icons/postIcons/share.svg',
                                    color: textLight,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  SvgPicture.asset(
                                    width: 14.w,
                                    'assets/Icons/postIcons/save.svg',
                                    color: textLight,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
