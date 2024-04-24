import 'package:flutter/material.dart';
import 'package:food_app/screen/cart/cart_page.dart';
import 'package:food_app/screen/food/popular_food_page.dart';
import 'package:food_app/screen/food/recommened_food_page.dart';
import 'package:food_app/screen/home/home_page.dart';
import 'package:food_app/screen/home/main_home_page.dart';
import 'package:food_app/screen/splashscreen/splach_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
class RouteHelper {
  static const String spalshScreen = '/Splash-screen';
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';
  static const String cartpage = '/cart-page';

  static String getSplashScreen() => '$spalshScreen';
  static String getInitial() => '$initial';
  static String getPopularFood(int PageId,String page) => '$popularFood?pageId=$PageId&page=$page';
  static String getRecommendedFood(int recommedPageID,String page) =>
      '$recommendedFood?recommedPageID=$recommedPageID&page=$page';
  static String getCartPage()=> '$cartpage';

  static List<GetPage> routes = [
    GetPage(name: spalshScreen, page: ()=> SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var Page = Get.parameters['page'];
        return PopulerFoodPage(pageID: int.parse(pageId!),page:Page!);
      },
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var recommedPageID = Get.parameters['recommedPageID'];
        var Page = Get.parameters['page'];
        return FoodDetails(pageId: int.parse(recommedPageID!),page:Page!);
      },
      transition: Transition.circularReveal,
    ),
    GetPage(name: cartpage, page: () => CartPage(),
    transition: Transition.circularReveal),
  ];
}