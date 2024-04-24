import 'package:flutter/material.dart';
import 'package:food_app/utils/deminstional.dart';
import 'package:food_app/widgets/small_text.dart';


class IconwithText extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;
  const IconwithText(
      {super.key,
        required this.icon,
        required this.iconColor,
        required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Demensions.iconSize24,
        ),
        SizedBox(
          width: Demensions.width5,
        ),
        SmallText(text: text),
      ],
    );
  }
}