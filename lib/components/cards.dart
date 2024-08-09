import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mangafeed/components/text.dart';
import 'package:mangafeed/properties.dart';

class MyCards extends StatefulWidget {
  const MyCards({super.key});

  @override
  State<MyCards> createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const MyContent(text1: '10', text2: 'Posts'),
        SizedBox(
          width: 15.w,
        ),
        const MyContent(text1: '24k', text2: 'Followers'),
        SizedBox(
          width: 15.w,
        ),
        const MyContent(text1: '38', text2: 'Following'),
      ],
    );
  }
}

class MyContent extends StatelessWidget {
  final String text1, text2;

  const MyContent({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          SizedBox(
            height: 95.h,
            width: 95.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80.h,
                  width: 80.w,
                  child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: shadowColor.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: foregroundColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.r),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Center vertically
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MyText(
                              text: text1,
                              font: "Poppins",
                              size: 20,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                          MyText(
                              text: text2,
                              font: "Poppins",
                              size: 16,
                              fontWeight: FontWeight.w400,
                              color: textSubtitle),
                        ],
                      )),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 21.h,
                      width: 21.w,
                      decoration: BoxDecoration(
                        color: cardNotif,
                        borderRadius: BorderRadius.all(
                          Radius.circular(60.r),
                        ),
                      ),
                    ),
                  ],
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyText(
                      text: '2',
                      font: "Poppins",
                      size: 10,
                      fontWeight: FontWeight.w400,
                      color: textLight,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
