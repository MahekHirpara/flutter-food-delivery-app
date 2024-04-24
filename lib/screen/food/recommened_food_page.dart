import 'package:flutter/material.dart';
import 'package:food_app/controller/cart_controller.dart';
import 'package:food_app/controller/popular_food_controller.dart';
import 'package:food_app/controller/recommended_food_controller.dart';
import 'package:food_app/routes/route_helper.dart';
import 'package:food_app/utils/app_const.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/deminstional.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/expended_text.dart';
import 'package:get/get.dart';


class FoodDetails extends StatelessWidget {
  final int pageId;
  final String page;
  const FoodDetails({super.key, required this.pageId,required this.page});

  @override
  Widget build(BuildContext context) {
    var product =
    Get.find<RecommadedFoodController>().recomededproductList[pageId];
    Get.find<PopulerFoodController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.maincolor,
            pinned: true,
            expandedHeight: Demensions.sliverAppbarHeight,
            title: Container(
              margin: EdgeInsets.only(top: Demensions.height15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if(page == 'cartpage'){
                        Get.toNamed(RouteHelper.getCartPage());
                      }else{
                        Get.toNamed(RouteHelper.getInitial());
                      }
                    },
                    child: const AppIcon(icon: Icons.clear),
                  ),
                  GetBuilder<PopulerFoodController>(builder: (controller) {
                    return GestureDetector(
                      onTap: (){
                        Get.toNamed(RouteHelper.getCartPage());
                      },
                      child: Stack(

                        children: [
                          const AppIcon(icon: Icons.shopping_cart_outlined),
                          Get.find<PopulerFoodController>().totalQuantity >= 1
                              ? const Positioned(
                            right: 0,
                            top: 0,
                            child:  AppIcon(
                                icon: Icons.circle,
                                size: 22,
                                iconColor: Colors.transparent,
                                backgroundColor: AppColors.maincolor,
                              ),
                            )
                              : Container(),
                          Get.find<PopulerFoodController>().totalQuantity >= 1
                              ? Positioned(
                              right: 6,
                              top: 4,
                              child: BigText(
                                text: Get.find<PopulerFoodController>()
                                    .totalQuantity
                                    .toString(),
                                size: 12,
                                color: Colors.white,
                              ))
                              : Container(),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                '${AppConstant.BASE_URL}/uploads/' + product.img,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Demensions.height45),
              child: Container(
                padding: EdgeInsets.only(
                    top: Demensions.height5, bottom: Demensions.height5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Demensions.radius25),
                    topRight: Radius.circular(Demensions.radius25),
                  ),
                  color: Colors.white,
                ),
                width: double.maxFinite,
                child: Center(
                  child: BigText(
                    text: product.name,
                    size: Demensions.font26,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: Demensions.height10,
                      left: Demensions.width15,
                      right: Demensions.width15),
                  child: ExpendedText(
                    text: product.description,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopulerFoodController>(
        builder: (recommendedProduct) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //fist column
              Container(
                padding: EdgeInsets.only(
                    left: Demensions.width20 * 2.5,
                    right: Demensions.width20 * 2.5,
                    top: Demensions.height10,
                    bottom: Demensions.height10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        recommendedProduct.setQuantity(false);
                      },
                      child: AppIcon(
                        icon: Icons.remove,
                        backgroundColor: AppColors.maincolor,
                        iconColor: Colors.white,
                        iconSize: Demensions.font20,
                      ),
                    ),
                    BigText(
                      text: '\$ ${product.price} X${recommendedProduct.cartItems}',
                      color: AppColors.mainBlackColor,
                      size: Demensions.font26,
                    ),
                    GestureDetector(
                      onTap: () {
                        recommendedProduct.setQuantity(true);
                      },
                      child: AppIcon(
                        icon: Icons.add,
                        backgroundColor: AppColors.maincolor,
                        iconColor: Colors.white,
                        iconSize: Demensions.font20,
                      ),
                    ),
                  ],
                ),
              ),
              //secound column
              Container(
                height: Demensions.navigatorContainer,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Demensions.radius25 * 2),
                      topRight: Radius.circular(Demensions.radius25 * 2),
                    ),
                    color: AppColors.buttonBackgroundColor),
                //row countainer
                child: Container(
                  padding: EdgeInsets.only(
                    left: Demensions.width15,
                    right: Demensions.width15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     // like container
                      Container(
                        padding: EdgeInsets.only(
                            top: Demensions.height20,
                            bottom: Demensions.height20,
                            left: Demensions.width20,
                            right: Demensions.width20),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(Demensions.radius25),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.maincolor,
                          size: Demensions.iconSize24,
                        ),
                      ),
                      //add to cart
                      GestureDetector(
                        onTap: () {
                        recommendedProduct.addIteams(product);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              top: Demensions.height20,
                              bottom: Demensions.height20,
                              left: Demensions.width20,
                              right: Demensions.width20),
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(Demensions.radius25),
                            color: AppColors.maincolor,
                          ),
                          child: Text(
                            '\$ ${product.price!} Add to cart',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: Demensions.font20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}