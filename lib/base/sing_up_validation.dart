import 'package:flutter/cupertino.dart';
import 'package:food_app/base/show_custome_snck.dart';
import 'package:get/get.dart';

bool passwordValidation(String passowrd){
  RegExp regex =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if(passowrd.isEmpty) {
    showCustomeSnackBar(title: "Password", 'Please enter password');
    return false;
  }
  else if(!regex.hasMatch(passowrd)){
    showCustomeSnackBar(title: "Password",'1 uppercase,1 lowercase, 1 special character, 1 numeric character and length 8 must be required');
    return false;
  }
  else{
    return true;
  }
}
bool emailValidation(String email){
  if(email.isEmpty){
    showCustomeSnackBar(title: "Email",'Please enter Email');
    return false;
  }
  else if(!GetUtils.isEmail(email)){
    showCustomeSnackBar(title: "email",'Please enter valid email');
    return false;
  }
  else{
    return true;
  }
}
bool nameValidation(String name){
  if(name.isEmpty){
    showCustomeSnackBar(title: "Name",'Please enter name');
    return false;
  }else{
    return true;
  }
}
bool phoneValidation(String phone){
  String patttern = r'(^(?:[+0]9)?[0-9]{10}$)';
  RegExp regExp = new RegExp(patttern);
  if(phone.isEmpty){
    showCustomeSnackBar(title: "Phone number",'Please enter phone number');
    return false;
  }
  else if(!regExp.hasMatch(phone)){
    showCustomeSnackBar(title: "Phone number",'Please enter valid phone number');
    return false;
  }
  else{
    return true;
  }
}