
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_app/base/custome_loader.dart';
import 'package:food_app/base/show_custome_snck.dart';
import 'package:food_app/base/sing_up_validation.dart';
import 'package:food_app/controller/auth_controller.dart';
import 'package:food_app/modal/sing_up_modal.dart';
import 'package:food_app/routes/route_helper.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/deminstional.dart';
import 'package:food_app/widgets/TextFieldWidget.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:get/get.dart';
class SingUpPage extends StatelessWidget {
  const SingUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController =  TextEditingController();
    TextEditingController passController =  TextEditingController();
    TextEditingController nameController =  TextEditingController();
    TextEditingController phoneController =  TextEditingController();
    var singUpImage=[
      'g.png',
      'f.png',
      'ta.png'
    ];
    void registrationValidation(AuthController authControlller){

      String email = emailController.text.trim();
      String password = passController.text.trim();
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();

      if(emailValidation(email) && passwordValidation(password) && nameValidation(name) && phoneValidation(phone) ){
        showCustomeSnackBar(title: 'Successfully','Registration succsefully', isError: false);
        SingUpModal singUpModal = SingUpModal(email: email, password: password, name: name, phone: phone);
        authControlller.registration(singUpModal).then((status){
          if(status.isSuccess){
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
              //email
              TextFieldWidget(hintText: 'Email',controller: emailController,icon: Icons.email,),
              SizedBox(height: Demensions.height20,),
              //password
              TextFieldWidget(hintText: 'Password',controller: passController,icon: Icons.password_sharp,isObscure: true,),
              SizedBox(height: Demensions.height20,),
              //name
              TextFieldWidget(hintText: 'Name',controller: nameController,icon: Icons.person,),
              SizedBox(height: Demensions.height20,),
              //phone
              TextFieldWidget(hintText: 'Phone',controller: phoneController,icon: Icons.phone,),
              SizedBox(height: Demensions.height30,),
              //singup button
              GestureDetector(
                onTap: (){
                  registrationValidation(authController);
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
                      text: 'Sing Up',
                      color: Colors.white,
                      size: Demensions.font20+Demensions.font20/2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Demensions.height10,),
              //login text
              RichText(
                text: TextSpan(
                    recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                    text: 'Have already Account?',
                    style: TextStyle(
                      fontSize: Demensions.font20,
                      color: Colors.grey[500],
                    ),
                ),
              ),
              SizedBox(height: Demensions.screenHeight*0.05,),
              //sing up option
              RichText(
                text: TextSpan(

                    text: 'Sing up using one of this following method',
                    style: TextStyle(
                      fontSize: Demensions.font16,
                      color: Colors.grey[500],
                    )
                ),
              ),
              Wrap(
                children: List.generate(3, (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: Demensions.radius30,
                    backgroundImage: AssetImage('assets/images/'+singUpImage[index]),
                  ),
                )),
              )

            ],
          ),
        ):CustomeLoader();
      },),

    );
  }
}
