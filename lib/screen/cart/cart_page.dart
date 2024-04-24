import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/controller/cart_controller.dart';
import 'package:food_app/controller/popular_food_controller.dart';
import 'package:food_app/controller/recommended_food_controller.dart';
import 'package:food_app/routes/route_helper.dart';
import 'package:food_app/screen/home/main_home_page.dart';
import 'package:food_app/utils/app_const.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/deminstional.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/small_text.dart';
import 'package:get/get.dart';


class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //navigation
          Positioned(
            top: Demensions.height45,
            left: Demensions.width20,
            right: Demensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.maincolor,
                    iconSize: Demensions.iconSize24,
                  ),
                ),
                SizedBox(
                  width: Demensions.width20,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.maincolor,
                    iconSize: Demensions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.maincolor,
                  iconSize: Demensions.iconSize24,
                )
              ],
            ),
          ),
          //text container
          Positioned(
            top: Demensions.height20 * 5,
            left: Demensions.width20,
            right: Demensions.width20,
            bottom: 0,
            child: Container(
              child: GetBuilder<CartController>(

                builder: (cartController) {

                  var _cartList = cartController.getItems;
                  return ListView.builder(
                    itemCount: _cartList.length,
                    itemBuilder: (context, index) {

                      return Container(
                        margin: EdgeInsets.only(bottom: Demensions.height10),
                        child: Row(
                          children: [
                            //image
                            GestureDetector(
                              onTap: (){
                                var popularListIndex = Get.find<PopulerFoodController>().populerFoodList.indexOf(_cartList[index].product!);
                                if(popularListIndex>=0){
                                  Get.toNamed(RouteHelper.getPopularFood(popularListIndex,'cartpage'));
                                }else{
                                  var recommendedListIndex = Get.find<RecommadedFoodController>().recomededproductList.indexOf(_cartList[index].product!);
                                  Get.toNamed(RouteHelper.getRecommendedFood(recommendedListIndex,'cartpage'));
                                }
                      },
                              child: Container(
                                height: Demensions.imageContainer,
                                width: Demensions.imageContainer,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(Demensions.radius25),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      AppConstant.BASE_URL +
                                          '/uploads/' +
                                          cartController.getItems[index].img!,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: Demensions.height20 * 5,
                                padding: EdgeInsets.only(
                                    left: Demensions.width10,
                                    right: Demensions.width10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight:
                                    Radius.circular(Demensions.radius15),
                                    bottomRight:
                                    Radius.circular(Demensions.radius15),
                                  ),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFFe8e8e8),
                                      blurRadius: 5,
                                      offset: Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    BigText(
                                        text: cartController
                                            .getItems[index].name!),
                                    SmallText(text: 'with indian flavor'),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        BigText(
                                          text: '\$' +
                                              cartController
                                                  .getItems[index].price!
                                                  .toString(),
                                          color: Colors.red,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: Demensions.height5,
                                              bottom: Demensions.height5,
                                              left: Demensions.width5,
                                              right: Demensions.width5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Demensions.radius15),
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                 cartController.addIteams(_cartList[index].product!, -1);
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
                                                _cartList[index].quantity.toString(),
                                                style: TextStyle(
                                                    fontSize:
                                                    Demensions.font20),
                                              ),
                                              SizedBox(
                                                width: Demensions.width10,
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    cartController.addIteams(_cartList[index].product!, 1);
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    size: Demensions.iconSize24,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar:  GetBuilder<CartController>(builder: (cartcontroller){

        return Container(
          height: Demensions.navigatorContainer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(Demensions.radius25*2),topRight: Radius.circular(Demensions.radius25*2) ),
            color: AppColors.buttonBackgroundColor,
          ),
          child: Container(
            padding: EdgeInsets.only(left: Demensions.width20,right: Demensions.width20 ),
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
                  child: BigText(text: '\$'+cartcontroller.totalAmount.toString() ,),
                ),
                GestureDetector(
                  onTap: () {
                    // recommendedProduct.addIteams(product);
                    cartcontroller.getCartHistory();
                    print('tapped');
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: Demensions.height20,
                        bottom: Demensions.height20,
                        left: Demensions.width20,
                        right: Demensions.width20),
                    child: Text(
                      'Check out',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Demensions.font20),
                    ),
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(Demensions.radius25),
                      color: AppColors.maincolor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },),


    );
  }
}




