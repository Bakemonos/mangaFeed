import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mangafeed/components/friendIcon.dart';
import 'package:mangafeed/components/friendPost.dart';
import 'package:mangafeed/properties.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DasboardState();
}

class _DasboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          floating: true,
          snap: true,
          centerTitle: true,
          toolbarHeight: 60.h,
          forceMaterialTransparency: true,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: SvgPicture.asset(
              'assets/Logos/mangaLogo.svg',
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 25.0, top: 20),
              child: SvgPicture.asset(
                width: 30.w,
                'assets/Icons/activeNotif.svg',
              ),
            ),
          ],
        ),
      ],
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Discover',
                    style: TextStyle(
                      fontSize: 16.sp,
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
