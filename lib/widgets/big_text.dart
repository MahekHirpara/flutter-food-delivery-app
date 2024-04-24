import 'package:flutter/material.dart';
import 'package:food_app/utils/deminstional.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color? color;
  double size;
  TextOverflow overflow;
  BigText(
      {super.key,
        required this.text,
        this.color = const Color(0xFF332d2d),
        this.size = 0,
        this.overflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
          color: color,
          fontSize: size == 0 ? Demensions.font20 : size,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400),
    );
  }
}