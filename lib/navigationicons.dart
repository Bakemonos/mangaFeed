import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget activeIcon(String iconName) {
  String activePath = 'assets/Icons/navIcons/active/$iconName';
  return SvgPicture.asset(activePath);
}

Widget defaultIcon(String iconName) {
  String defaultPath = 'assets/Icons/navIcons/default/$iconName';
  return SvgPicture.asset(defaultPath);
}
