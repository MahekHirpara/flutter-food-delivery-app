import 'package:flutter/material.dart';
import 'package:food_app/controller/popular_food_controller.dart';
import 'package:food_app/controller/recommended_food_controller.dart';
import 'package:food_app/screen/home/main_page_body.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/deminstional.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/small_text.dart';
import 'package:get/get.dart';



class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  Future<void> lodeResource() async{
    await Get.find<PopulerFoodController>().PopulerFoodList();
    await  Get.find<RecommadedFoodController>().recommenedProductList();
  }
  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(child:  Column(
      children: [
        Container(
          child: Container(
            margin: const EdgeInsets.only(top: 45, bottom: 15),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                      text: 'India',
                      color: AppColors.maincolor,
                    ),
                    Row(
                      children: [
                        SmallText(text: 'Surat'),
                        const Icon(Icons.arrow_drop_down_rounded),
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    height: Demensions.height45,
                    width: Demensions.width45,
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(Demensions.radius15),
                      color: AppColors.maincolor,
                    ),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: Demensions.iconSize24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Expanded(child: SingleChildScrollView(child: MainPageBody())),
      ],
    ), onRefresh: lodeResource);
    //   Scaffold(
    //   body:,
    // );
  }
}
