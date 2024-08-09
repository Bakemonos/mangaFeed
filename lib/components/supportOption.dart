import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mangafeed/properties.dart';

class MySupportOption extends StatelessWidget {
  final String icon1;
  final String icon2;
  final String icon3;
  const MySupportOption({
    super.key,
    required this.icon1,
    required this.icon2,
    required this.icon3,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MySupport(
          icon: icon1,
        ),
        SizedBox(
          width: 8.w,
        ),
        MySupport(
          icon: icon2,
        ),
        SizedBox(
          width: 8.w,
        ),
        MySupport(
          icon: icon3,
        ),
      ],
    );
  }
}

class MySupport extends StatelessWidget {
  final String icon;

  const MySupport({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 60.h,
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
          child: SvgPicture.asset(
            'assets/Icons/$icon',
            fit: BoxFit.none,
          ),
        ),
      ),
    );
  }
}
