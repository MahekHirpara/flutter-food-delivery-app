import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/deminstional.dart';
class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  bool isObscure;
   TextFieldWidget({super.key,required this.hintText,required this.controller,required this.icon,this.isObscure= false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Demensions.width20,right: Demensions.width20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Demensions.radius15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(1,1),
              blurRadius: 3,
              spreadRadius: 1,
              color: Colors.grey.withOpacity(0.2),
            )
          ]
      ),
      child: TextField(
        obscureText: isObscure ,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon,color: AppColors.yellowColor,),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Demensions.radius15),
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(Demensions.radius15),
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          border:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(Demensions.radius15),

          ),
        ),
      ),
    );
  }
}
