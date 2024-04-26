import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/deminstional.dart';
import 'package:food_app/widgets/account_widget.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BigText(text: 'Profile',color: Colors.white,size: Demensions.font24,),
        backgroundColor: AppColors.maincolor,
      ),
      body: Container(
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
                      AccountWidget(text: BigText(text: 'Mahek',),
                        icon: AppIcon(icon: Icons.person,
                        iconSize: Demensions.height10*5/2,
                        size: Demensions.height10*5,
                        backgroundColor: AppColors.maincolor,
                        iconColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: Demensions.height20,),
                      //phone
                      AccountWidget(text: BigText(text: '9313194461',),
                        icon: AppIcon(icon: Icons.phone,
                          iconSize: Demensions.height10*5/2,
                          size: Demensions.height10*5,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: Demensions.height20,),
                      //email
                      AccountWidget(text: BigText(text: 'mahekhirpara63@gmail.com',),
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
                      AccountWidget(text: BigText(text: 'sdfhgj',),
                        icon: AppIcon(icon: Icons.message_outlined,
                          iconSize: Demensions.height10*5/2,
                          size: Demensions.height10*5,
                          backgroundColor: AppColors.maincolor,
                          iconColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: Demensions.height20,),
                      //kjb
                      AccountWidget(text: BigText(text: 'sdfhgj',),
                        icon: AppIcon(icon: Icons.message_outlined,
                          iconSize: Demensions.height10*5/2,
                          size: Demensions.height10*5,
                          backgroundColor: AppColors.maincolor,
                          iconColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: Demensions.height20,),
                    ],
                  ),
                ),
            ),

          ],
        ),
      ),
    );
  }
}
