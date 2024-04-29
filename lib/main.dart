import 'package:flutter/material.dart';
import 'package:food_app/controller/cart_controller.dart';
import 'package:food_app/controller/popular_food_controller.dart';
import 'package:food_app/controller/recommended_food_controller.dart';
import 'package:food_app/controller/user_controller.dart';
import 'package:food_app/helper/dependencies.dart' as dep;
import 'package:food_app/screen/auth/sing_up.dart';
import 'package:get/get.dart';
import 'package:food_app/screen/auth/sing_in.dart';

import 'routes/route_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartList();
    Get.find<UserController>();
    return GetBuilder<PopulerFoodController>(builder: (_){
      return GetBuilder<RecommadedFoodController>(builder: (_){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RouteHelper.getSplashScreen(),
          getPages: RouteHelper.routes,
          // home: SingInPage(),
        );
      });
    });

  }
}

