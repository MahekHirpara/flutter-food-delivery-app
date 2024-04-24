
import 'package:flutter/material.dart';
import 'package:food_app/controller/cart_controller.dart';
import 'package:food_app/utils/app_const.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/deminstional.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:get/get.dart';
class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
   
    var cartHistory = Get.find<CartController>().getCardHistory();
    Map<String,int> cartItemsperOrder =Map();

    for(int i =0;i<cartHistory.length;i++){
      if(cartItemsperOrder.containsKey(cartHistory[i].time)){
        cartItemsperOrder.update(cartHistory[i].time!, (value) => ++value);
      }else{
        cartItemsperOrder.putIfAbsent(cartHistory[i].time!, () => 1);
      }
    }

    List<int> cartOrderItemsToList(){
     return  cartItemsperOrder.entries.map((e) => e.value).toList();
    }

    List<int> itemsPerOrder = cartOrderItemsToList();
    // var listCounter = 0;
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
                              BigText(text: '05/02/11'),
                              SizedBox(height: Demensions.height5,),
                              Row(
                                children: [
                                  Wrap(
                                    direction: Axis.horizontal,
                                    children:List.generate(itemsPerOrder[i], (index)  {
                                      return index<=2 ? Container(
                                        margin: EdgeInsets.only(right: Demensions.width15/2),
                                        height: Demensions.cartHistoryImages,
                                        width:  Demensions.cartHistoryImages,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(Demensions.radius15),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  AppConstant.BASE_URL+'/uploads/'+cartHistory[index].img!,
                                                )
                                            )
                                        ),
                                      ) : Container();

                                    }),
                                  )
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
