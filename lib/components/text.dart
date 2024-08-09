import 'package:flutter/widgets.dart';

class MyText extends StatelessWidget {
  final String text;
  final String font;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  const MyText(
      {super.key,
      required this.text,
      required this.font,
      required this.size,
      required this.fontWeight,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: font,
          fontSize: size,
          fontWeight: fontWeight,
          color: color),
    );
  }
}
