import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/base/custome_loader.dart';
import 'package:food_app/base/show_custome_snck.dart';
import 'package:food_app/base/sing_up_validation.dart';
import 'package:food_app/routes/route_helper.dart';
import 'package:food_app/screen/auth/sing_up.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/deminstional.dart';
import 'package:food_app/widgets/TextFieldWidget.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
class SingInPage extends StatelessWidget {
  const SingInPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController =  TextEditingController();
    TextEditingController passController =  TextEditingController();
    void login(AuthController authController){

      String email = emailController.text.trim();
      String password = passController.text.trim();

      if(emailValidation(email) && passwordValidation(password)  ){

        authController.login( email, password).then((status){
          if(status.isSuccess){
            showCustomeSnackBar(title: 'Successfully','Login succsefully', isError: false);
            Get.toNamed(RouteHelper.getInitial());
          }else{
            showCustomeSnackBar(status.message);
          }
        });
      }

    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (authController){
        return !authController.isLoding?SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: Demensions.screenHeight*0.05,),
              Container(
                margin: EdgeInsets.only(left: Demensions.width20,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap:(){
                        Navigator.pop(context);
                       },
                        child: AppIcon(
                            icon: Icons.clear
                        ),
                    ),
                  ],
                ),
              ),
              //logo
              Container(
                height: Demensions.screenHeight*0.25,
                child: Center(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                        'assets/images/Good Food Logo.jpg'
                    ),
                  ),
                ),
              ),
              //Wlcome
              Container(
                margin: EdgeInsets.only(left: Demensions.width20,),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello',
                      style: TextStyle(
                        fontSize: Demensions.font20*3+Demensions.font20/2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Sing in your account',
                      style: TextStyle(
                        fontSize: Demensions.font20,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Demensions.height20,),
              //email
              TextFieldWidget(hintText: 'Email',controller: emailController,icon: Icons.email,),
              SizedBox(height: Demensions.height20,),
              //password
              TextFieldWidget(hintText: 'Password',controller: passController,icon: Icons.password_sharp,isObscure: true,),
              SizedBox(height: Demensions.height10,),

              //line
              Row(
                children: [
                  Expanded(child: Container()),
                  RichText(
                    text: TextSpan(

                        text: 'Sing in to your account',
                        style: TextStyle(
                          fontSize: Demensions.font16,
                          color: Colors.grey[500],
                        )
                    ),
                  ),
                  SizedBox(width: Demensions.width20,),
                ],
              ),
              SizedBox(height: Demensions.height30,),

              //singin button
              GestureDetector(
                onTap: (){
                  login(authController);
                },
                child: Container(
                  width: Demensions.screenWidth/2,
                  height: Demensions.screenHeight/13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Demensions.radius30),
                    color: AppColors.maincolor,
                  ),
                  child: Center(
                    child: BigText(
                      text: 'Sing in',
                      color: Colors.white,
                      size: Demensions.font20+Demensions.font20/2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Demensions.screenHeight*0.05,),

              //login text
              RichText(
                text: TextSpan(
                    text: 'Don\'t an Account?',
                    style: TextStyle(
                      fontSize: Demensions.font16,
                      color: Colors.grey[500],
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap =() =>  Get.to(()=>SingUpPage(),transition: Transition.fade),
                        text: ' Create', style: TextStyle(
                        fontSize: Demensions.font20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      )
                    ]
                ),
              ),



            ],
          ),
        ):CustomeLoader();
      },)
      ,
    );
  }
}
