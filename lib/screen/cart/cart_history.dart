

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/controller/cart_controller.dart';
import 'package:food_app/modal/cart_modal.dart';
import 'package:food_app/routes/route_helper.dart';
import 'package:food_app/utils/app_const.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/deminstional.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
   
    var cartHistory = Get.find<CartController>().getCardHistory().reversed.toList();
    Map<String,int> cartItemsperOrder =Map();

    for(int i =0;i<cartHistory.length;i++){
      if(cartItemsperOrder.containsKey(cartHistory[i].time)){
        cartItemsperOrder.update(cartHistory[i].time!, (value) => ++value);
      }else{
        cartItemsperOrder.putIfAbsent(cartHistory[i].time!, () => 1);
      }
    }

    List<int> cartItemsPerOrderToList(){
     return  cartItemsperOrder.entries.map((e) => e.value).toList();
    }

    List<String> cartOrederTimeToList(){
      return  cartItemsperOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList();
    var listCounter = 0;
    return Scaffold(

      body: Column(
        children: [
         Container(
           height: Demensions.textContainer,
           color: AppColors.maincolor,
           width: double.maxFinite,
           padding: EdgeInsets.only(top: Demensions.height45),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               Center(child: BigText(text: 'Your Cart History',color: Colors.white,),),
               const AppIcon(icon: Icons.shopping_cart_outlined,iconColor: AppColors.maincolor,)
             ],
           ),
         ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: Demensions.height20,left: Demensions.width20,right: Demensions.width20),

              child: MediaQuery.removePadding(
                removeTop: true,
                  context: context,
                  child: ListView(
                    children: [
                      for(int i =0;i<itemsPerOrder.length;i++)
                        Container(
                          margin: EdgeInsets.only(bottom: Demensions.height20),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ((){
                                DateTime parseDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(cartHistory[listCounter].time!);
                                var inputDate = DateTime.parse(parseDate.toString());
                                var outputformate = DateFormat('MM/dd/yyyy HH:mm a');
                                var outputDate = outputformate.format(inputDate);
                               return BigText(text: outputDate);
                              }()),

                              SizedBox(height: Demensions.height5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Wrap(
                                    direction: Axis.horizontal,
                                    children:List.generate(itemsPerOrder[i], (index)  {
                                      if(listCounter<cartHistory.length){
                                        listCounter++;
                                      }
                                      return index<=2 ? Container(
                                        margin: EdgeInsets.only(right: Demensions.width15/2),
                                        height: Demensions.cartHistoryImages,
                                        width:  Demensions.cartHistoryImages,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(Demensions.radius15),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  AppConstant.BASE_URL+'/uploads/'+cartHistory[listCounter-1].img!,
                                                )
                                            )
                                        ),
                                      ) : Container();

                                    }),
                                  ),
                                  Container(
                                    height: Demensions.cartHistoryImages,
                                    child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SmallText(text: 'Total',color: AppColors.titleColor,),
                                        BigText(text: itemsPerOrder[i].toString()+' Items',color: AppColors.titleColor,),
                                        GestureDetector(
                                          onTap: (){
                                             var orderTime = cartOrederTimeToList();
                                             Map<int,CartModal> moreOrder={};

                                             for(int j=0;j<cartHistory.length;j++){
                                               if(cartHistory[j].time == orderTime[i]){
                                                 moreOrder.putIfAbsent(cartHistory[j].id!, ()  =>
                                                   CartModal.fromJson(jsonDecode(jsonEncode(cartHistory[j]))),
                                                 );
                                               }
                                             }
                                             Get.find<CartController>().setItems = moreOrder;
                                             Get.find<CartController>().addtoCart();
                                             Get.toNamed(RouteHelper.getCartPage());
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(Demensions.height5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(Demensions.radius15/2),
                                              border: Border.all(width: 1,color: AppColors.maincolor),
                                            ),
                                            child: SmallText(text: 'one more',color: AppColors.maincolor,),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              )
                            ],
                          ),

                        ),
                    ],
                  ),
              ),

            ),
          )
        ],
      ),
    );
  }
}
