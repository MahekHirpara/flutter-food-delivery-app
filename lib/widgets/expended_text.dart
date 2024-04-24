import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/deminstional.dart';
import 'package:food_app/widgets/small_text.dart';

class ExpendedText extends StatefulWidget {
  final String text;
  const ExpendedText({super.key, required this.text});

  @override
  State<ExpendedText> createState() => _ExpendedTextState();
}

class _ExpendedTextState extends State<ExpendedText> {
  late String fristHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Demensions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > textHeight) {
      fristHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      fristHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(text: fristHalf)
          : Column(
        children: [
          SmallText(
              size: Demensions.font18,
              color: AppColors.paraColor,
              text: hiddenText
                  ? ('$fristHalf...')
                  : fristHalf + secondHalf),
          InkWell(
            onTap: () {
              setState(() {
                hiddenText = !hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(
                  text: 'Show more',
                  color: AppColors.maincolor,
                ),
                Icon(
                  hiddenText
                      ? Icons.arrow_drop_down
                      : Icons.arrow_drop_up,
                  color: AppColors.maincolor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
