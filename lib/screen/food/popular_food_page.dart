import 'package:flutter/material.dart';
import 'package:food_app/controller/cart_controller.dart';
import 'package:food_app/controller/popular_food_controller.dart';
import 'package:food_app/routes/route_helper.dart';
import 'package:food_app/utils/app_const.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/deminstional.dart';
import 'package:food_app/widgets/app_column.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/expended_text.dart';
import 'package:get/get.dart';


class PopulerFoodPage extends StatelessWidget {
  final int pageID;
  final String page;

  const PopulerFoodPage({Key? key, required this.pageID,required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopulerFoodController>().populerFoodList[pageID];
    Get.find<PopulerFoodController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
        body: Stack(
          children: [
            //image
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Demensions.populerFoodImage,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      AppConstant.BASE_URL + '/uploads/' + product.img,
                    ),
                  ),
                ),
              ),
            ),
            //buttons
            Positioned(
              top: Demensions.height30,
              left: Demensions.width10,
              right: Demensions.width10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        if(page == 'cartpage'){
                          Get.toNamed(RouteHelper.getCartPage());
                        }else{
                          Get.toNamed(RouteHelper.getInitial());
                        }
                      },
                      child: AppIcon(icon: Icons.arrow_back_ios)),
                  GetBuilder<PopulerFoodController>(builder: (controller) {
                    return GestureDetector(
                      onTap: (){
                        Get.toNamed(RouteHelper.getCartPage());
                      },
                      child: Stack(

                        children: [

                            AppIcon(icon: Icons.shopping_cart),

                          Get.find<PopulerFoodController>().totalQuantity >= 1
                              ? Positioned(
                            right: 0,
                            top: 0,
                            child: AppIcon(
                              icon: Icons.circle,
                              size: 22,
                              backgroundColor: AppColors.maincolor,
                              iconColor: Colors.transparent,
                            ),
                          )
                              : Container(),
                          Get.find<PopulerFoodController>().totalQuantity >= 1
                              ? Positioned(
                            right: 6,
                            top: 3,
                            child: BigText(
                              text: Get.find<PopulerFoodController>()
                                  .totalQuantity
                                  .toString(),
                              color: Colors.white,
                              size: 12,
                            ),
                          )
                              : Container(),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
            //text Container
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Demensions.populerFoodImage - 20,
              child: Container(
                padding: EdgeInsets.only(
                    left: Demensions.width10,
                    right: Demensions.width25,
                    top: Demensions.height20),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Demensions.radius15),
                    topRight: Radius.circular(Demensions.radius15),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                      text: product.name,
                      rate: product.stars,
                    ),
                    SizedBox(
                      height: Demensions.height20,
                    ),
                    BigText(text: 'Introduction'),
                    SizedBox(
                      height: Demensions.height15,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpendedText(
                          text: product.description,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<PopulerFoodController>(
          builder: (popularProduct) {
            return Container(
              height: Demensions.navigatorContainer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Demensions.radius25 * 2),
                  topRight: Radius.circular(Demensions.radius25 * 2),
                ),
                color: AppColors.buttonBackgroundColor,
              ),
              child: Container(
                padding: EdgeInsets.only(
                  left: Demensions.width15,
                  right: Demensions.width15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              popularProduct.setQuantity(false);
                            },
                            child: Icon(
                              Icons.remove,
                              size: Demensions.iconSize24,
                            ),
                          ),
                          SizedBox(
                            width: Demensions.width10,
                          ),
                          Text(
                            popularProduct.cartItems.toString(),
                            style: TextStyle(fontSize: Demensions.font20),
                          ),
                          SizedBox(
                            width: Demensions.width10,
                          ),
                          GestureDetector(
                              onTap: () {
                                popularProduct.setQuantity(true);
                              },
                              child: Icon(
                                Icons.add,
                                size: Demensions.iconSize24,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: Demensions.height20,
                          bottom: Demensions.height20,
                          left: Demensions.width20,
                          right: Demensions.width20),
                      child: GestureDetector(
                        onTap: () {
                          popularProduct.addIteams(product);
                        },
                        child: BigText(
                          text: '\$ ${product.price!} Add to cart',
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(Demensions.radius25),
                        color: AppColors.maincolor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}