import 'package:get/get.dart';

class Demensions {
  // var height = 812;
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageContainer = screenHeight / 2.53;
  static double pageViewContainer = screenHeight / 3.69;
  static double textContainer = screenHeight / 6.76;
  static double imageContainer = screenHeight / 6.76;
  static double sliverAppbarHeight = screenHeight / 2.70;

  // margin and padding height
  static double height5 = screenHeight / 162.4;
  static double height10 = screenHeight / 81.2;
  static double height15 = screenHeight / 54.13;
  static double height20 = screenHeight / 40.6;
  static double height25 = screenHeight / 32.48;
  static double height30 = screenHeight / 27.06;
  static double height45 = screenHeight / 18.04;

  // margin and padding width
  static double width5 = screenWidth / 75;
  static double width10 = screenWidth / 37.5;
  static double width15 = screenWidth / 25;
  static double width25 = screenWidth / 15;
  static double width45 = screenWidth / 8.33;
  static double width20 = screenWidth / 18.75;

  //radius
  static double radius30 = screenHeight / 27.06;
  static double radius25 = screenHeight / 32.48;
  static double radius15 = screenHeight / 54.13;

  //font
  static double font20 = screenHeight / 40.6;
  static double font26 = screenHeight / 31.23;
  static double font12 = screenHeight / 67.66;
  static double font14 = screenHeight / 58;
  static double font18 = screenHeight / 45.11;

  //icons
  static double iconSize24 = screenHeight / 33.83;
  static double iconSize16 = screenHeight / 50.75;

  //ListView
  static double listViewTextContainer = screenHeight / 8.12;

  //populer food page
  static double populerFoodImage = screenHeight / 2.32;

  //navigator
  static double navigatorContainer = screenHeight / 6.76;

// spash screen
 static double spashScreenImage = screenHeight/2.16;

 //cart images
static double cartHistoryImages = screenHeight/10.8;
}