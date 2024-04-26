import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/deminstional.dart';
class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  const TextFieldWidget({super.key,required this.hintText,required this.controller,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Demensions.width20,right: Demensions.width20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Demensions.radius30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(1,10),
              blurRadius: 10,
              spreadRadius: 7,
              color: Colors.grey.withOpacity(0.2),
            )
          ]
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon,color: AppColors.yellowColor,),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Demensions.radius30),
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(Demensions.radius30),
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          border:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(Demensions.radius30),

          ),
        ),
      ),
    );
  }
}
