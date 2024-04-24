import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/deminstional.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/icon_with_text.dart';
import 'package:food_app/widgets/small_text.dart';


class AppColumn extends StatelessWidget {
  final String text;
  final int? rate;
  const AppColumn({
    super.key,
    required this.text,
    this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Demensions.font26,
        ),
        SizedBox(
          height: Demensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                      (index) => const Icon(
                    Icons.star,
                    color: AppColors.maincolor,
                    size: 15,
                  )),
            ),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: rate.toString()),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: '1348'),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: 'Review'),
          ],
        ),
        SizedBox(
          height: Demensions.height15,
        ),
        const Row(
          children: [
            IconwithText(
                icon: Icons.circle_sharp,
                iconColor: AppColors.iconColor1,
                text: 'Normal'),
            SizedBox(
              width: 10,
            ),
            IconwithText(
                icon: Icons.location_on,
                iconColor: AppColors.maincolor,
                text: '7.3km'),
            SizedBox(
              width: 10,
            ),
            IconwithText(
                icon: Icons.access_time_filled_rounded,
                iconColor: AppColors.iconColor2,
                text: '32min'),
          ],
        ),
      ],
    );
  }
}