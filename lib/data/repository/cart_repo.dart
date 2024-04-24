import 'dart:convert';

import 'package:food_app/modal/cart_modal.dart';
import 'package:food_app/utils/app_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart=[];
  List<String> cartHistory=[];

  void addToCart(List<CartModal> cartList){
    // sharedPreferences.remove(AppConstant.CART_LIST);
    // sharedPreferences.remove(AppConstant.CART_HISTORY_LIST);
    cart=[];
    
    cartList.forEach((element) { 
      return cart.add(jsonEncode(element));
    });
    
    sharedPreferences.setStringList(AppConstant.CART_LIST, cart);
    // print(sharedPreferences.getStringList(AppConstant.CART_LIST));
    getCartList();
  }

  List<CartModal> getCartList(){
    List<String> carts=[];
    if(sharedPreferences.containsKey(AppConstant.CART_LIST)){
       carts = sharedPreferences.getStringList(AppConstant.CART_LIST)!;
       print('insid get cart list'+carts.toString());
    }

    List<CartModal> cartList=[];

    carts.forEach((element) => cartList.add(CartModal.fromJson(jsonDecode(element))));
    return cartList;
  }

  List<CartModal> getCartHistory(){
    if(sharedPreferences.containsKey(AppConstant.CART_HISTORY_LIST)){
      cartHistory=[];
      cartHistory = sharedPreferences.getStringList(AppConstant.CART_HISTORY_LIST)!;
    }

    List<CartModal> cartHistoryList=[];

    cartHistory.forEach((element) => cartHistoryList.add(CartModal.fromJson(jsonDecode(element))));
    return cartHistoryList;
  }

  void addtoCartHistory(){
    if(sharedPreferences.containsKey(AppConstant.CART_HISTORY_LIST)){
      cartHistory= sharedPreferences.getStringList(AppConstant.CART_HISTORY_LIST)!;
    }
    for(int i=0;i<cart.length;i++){
      print('History List'+cart[i].toString());
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList(AppConstant.CART_HISTORY_LIST, cartHistory);
    print('history cart list legth'+getCartHistory().length.toString());
  }

  void removeCart(){
    cart=[];
    sharedPreferences.remove(AppConstant.CART_LIST);
  }
}
