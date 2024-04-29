
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_app/base/custome_loader.dart';
import 'package:food_app/controller/auth_controller.dart';
import 'package:food_app/controller/cart_controller.dart';
import 'package:food_app/controller/user_controller.dart';
import 'package:food_app/routes/route_helper.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/deminstional.dart';
import 'package:food_app/widgets/account_widget.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:get/get.dart';
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {

    bool userLoggedIn= Get.find<AuthController>().userLoggedIn();
    if(userLoggedIn){
      Get.find<UserController>().getUserInfo();
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BigText(text: 'Profile',color: Colors.white,size: Demensions.font24,),
        backgroundColor: AppColors.maincolor,
      ),
      body:GetBuilder<UserController>(builder: (userController){
        return userLoggedIn ?
        (userController.isLoding? Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(top: Demensions.height20),
          child: Column(
            children: [
              AppIcon(icon: Icons.person,
                backgroundColor: AppColors.maincolor,
                iconColor: Colors.white,
                iconSize: Demensions.height25*3,
                size: Demensions.height15*10,
              ),
              SizedBox(height: Demensions.height30,),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AccountWidget(text: BigText(text: userController.userModal.name,),
                        icon: AppIcon(icon: Icons.person,
                          iconSize: Demensions.height10*5/2,
                          size: Demensions.height10*5,
                          backgroundColor: AppColors.maincolor,
                          iconColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: Demensions.height20,),
                      //phone
                      AccountWidget(text: BigText(text: userController.userModal.phone,),
                        icon: AppIcon(icon: Icons.phone,
                          iconSize: Demensions.height10*5/2,
                          size: Demensions.height10*5,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: Demensions.height20,),
                      //email
                      AccountWidget(text: BigText(text: userController.userModal.email),
                        icon: AppIcon(icon: Icons.email_outlined,
                          iconSize: Demensions.height10*5/2,
                          size: Demensions.height10*5,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: Demensions.height20,),
                      //address
                      AccountWidget(text: BigText(text: 'Surat',),
                        icon: AppIcon(icon: Icons.location_on,
                          iconSize: Demensions.height10*5/2,
                          size: Demensions.height10*5,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: Demensions.height20,),
                      //msg
                      GestureDetector(
                        onTap: (){
                          if(Get.find<AuthController>().userLoggedIn()){

                            Get.find<AuthController>().clearShareData();
                            Get.find<CartController>().clear();
                            Get.find<CartController>().clearCartHistory();
                            Get.offNamed(RouteHelper.getSingIn());
                          }else{
                            print('you logged out');
                          }

                        },
                        child: AccountWidget(text: BigText(text: 'Logout',),
                          icon: AppIcon(icon: Icons.message_outlined,
                            iconSize: Demensions.height10*5/2,
                            size: Demensions.height10*5,
                            backgroundColor: Colors.redAccent,
                            iconColor: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: Demensions.height20,),

                    ],
                  ),
                ),
              ),

            ],
          ),
        )
            :CustomeLoader() ) :
        Container(
          child: Center(
            child:RichText(
              text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap=()=>Get.toNamed(RouteHelper.getSingIn()),
                  text: 'You must have to Login. Please click here',
                  style: TextStyle(
                    fontSize: Demensions.font20,
                    color: Colors.grey[500],
                  )
              ),
            ) ,
          ),
        );
      },),

    );
  }
}
