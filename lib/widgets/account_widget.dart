import 'package:flutter/material.dart';
import 'package:food_app/utils/deminstional.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
class AccountWidget extends StatelessWidget {
  final AppIcon icon;
  final BigText text;
  const AccountWidget({super.key,required this.text,required this.icon});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(left: Demensions.width20,top: Demensions.height10,bottom: Demensions.height10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0,2),
            blurRadius: 1,
            color: Colors.grey.withOpacity(0.2),
          )
        ]
      ),
      child: Row(
          children: [
            icon,
            SizedBox(width: Demensions.width20,),
            text,
          ],
      ),
    );
  }
}
