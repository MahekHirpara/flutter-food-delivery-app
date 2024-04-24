import 'package:flutter/material.dart';
import 'package:food_app/controller/cart_controller.dart';
import 'package:food_app/controller/popular_food_controller.dart';
import 'package:food_app/controller/recommended_food_controller.dart';
import 'package:food_app/screen/home/home_page.dart';
import 'package:food_app/screen/home/main_home_page.dart';
import 'package:food_app/helper/dependencies.dart' as dep;
import 'package:food_app/screen/splashscreen/splach_screen.dart';
import 'package:get/get.dart';

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
    return GetBuilder<PopulerFoodController>(builder: (_){
      return GetBuilder<RecommadedFoodController>(builder: (_){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RouteHelper.getSplashScreen(),
          getPages: RouteHelper.routes,
        );
      });
    });

  }
}

