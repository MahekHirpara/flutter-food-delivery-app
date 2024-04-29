import 'package:flutter/material.dart';
import 'package:food_app/controller/auth_controller.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/deminstional.dart';
import 'package:get/get.dart';
class CustomeLoader extends StatelessWidget {
  const CustomeLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: Demensions.height20*5,
        width: Demensions.height20*5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Demensions.height20*5/2),
          color: Colors.white,
        ),
        alignment: Alignment.center,
        child: CircularProgressIndicator(color:AppColors.maincolor,),
      ),
    );
  }
}
