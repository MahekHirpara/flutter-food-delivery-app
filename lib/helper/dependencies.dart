import 'package:food_app/controller/cart_controller.dart';
import 'package:food_app/controller/popular_food_controller.dart';
import 'package:food_app/controller/recommended_food_controller.dart';
import 'package:food_app/data/api/api_client.dart';
import 'package:food_app/data/repository/cart_repo.dart';
import 'package:food_app/data/repository/popular_food_repo.dart';
import 'package:food_app/data/repository/recommened_food_repo.dart';
import 'package:food_app/utils/app_const.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> init() async {
  var sharedPreference = await SharedPreferences.getInstance();

  Get.lazyPut(()=> sharedPreference);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.BASE_URL));
  //repo
  Get.lazyPut(() => PopulerFoodRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedFoodRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  //controller
  Get.lazyPut(() => PopulerFoodController(populerFoodRepo: Get.find()));
  Get.lazyPut(() => RecommadedFoodController(recommendedFoodRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}