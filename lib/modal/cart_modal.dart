

import 'package:food_app/modal/popular_food_modal.dart';

class CartModal {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExit;
  String? time;
  ProductModal? product;

  CartModal({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExit,
    this.time,
    this.product,
  });

  CartModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    isExit = json['isExit'];
    time = json['time'];
    product = ProductModal.fromJson(json['product']);
  }

  Map<String,dynamic> toJson(){
    return{
      "id": id,
     "name" : name,
    "price" : price,
    "img" : img,
    "quantity" : quantity,
    "isExit" : isExit,
    "time" : time,
      "product" : product!.toJson(),
    };
  }
}