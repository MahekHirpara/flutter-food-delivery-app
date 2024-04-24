import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/controller/popular_food_controller.dart';
import 'package:food_app/controller/recommended_food_controller.dart';
import 'package:food_app/routes/route_helper.dart';
import 'package:food_app/utils/deminstional.dart';
import 'package:get/get.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> animation;

  void _lodeResource() async{
    await Get.find<PopulerFoodController>().PopulerFoodList();
    await  Get.find<RecommadedFoodController>().recommenedProductList();
  }

  @override
  void initState(){
    super.initState();
    _lodeResource();
    controller = AnimationController(vsync: this,duration: const Duration(seconds: 3))..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(const Duration(seconds: 4),()=>Get.offNamed(RouteHelper.getInitial()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(scale: animation,
            child: Center(child: Image.asset('assets/images/Good Food Logo.jpg',width: Demensions.spashScreenImage,),),),
          // Center(child: Image.asset('assets/images/logo2.jpg',width: 250,)),
        ],
      ),
    );
  }
}
