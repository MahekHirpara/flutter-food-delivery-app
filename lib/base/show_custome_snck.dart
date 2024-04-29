import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:get/get.dart';

void showCustomeSnackBar(String message,{bool isError = true,String title = 'Error'}){
   Get.snackbar(title,message,
     titleText: BigText(text: title,color: Colors.white,),
     messageText: Text(message,style: TextStyle(
       color: Colors.white,
     ),
     ),
     backgroundColor: isError ? Colors.redAccent : AppColors.maincolor,
     snackPosition: SnackPosition.TOP,
     colorText: Colors.white,
   );
}