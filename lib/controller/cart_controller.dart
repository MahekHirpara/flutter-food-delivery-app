import 'package:food_app/data/repository/cart_repo.dart';
import 'package:food_app/modal/cart_modal.dart';
import 'package:food_app/modal/popular_food_modal.dart';
import 'package:food_app/utils/colors.dart';
import 'package:get/get.dart';


class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModal> _items = {};
  Map<int, CartModal> get items => _items;
  List<CartModal> storageItems =[];

  void addIteams(ProductModal product, int quantity) {
    var totalQuantity =0;
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity!+quantity;
        print('updated');
        return CartModal(
          id: value.id,
          name: value.name,
          img: value.img,
          price: value.price,
          quantity: value.quantity!+quantity,
          isExit: true,
          time: DateTime.now().toString(),
          product:product,
        );
      });
      _items.forEach((key, value) {
        print("id is " +
            value.id.toString() +
            " Quantity is " +
            value.quantity.toString());
      });
      if(totalQuantity<=0){
        _items.remove(product.id);
      }

    } else {
      if(quantity>0){
        _items.putIfAbsent(product.id!, () {
          print('added');
          return CartModal(
            id: product.id,
            name: product.name,
            img: product.img,
            price: product.price,
            quantity: quantity,
            isExit: true,
            time: DateTime.now().toString(),
            product:product,
          );
        });
        items.forEach((key, value) {
          print("id is " +
              value.id.toString() +
              " Quantity is " +
              value.quantity.toString());
        });
      }else{
        Get.snackbar('Add Items', 'add Items',
            backgroundColor: AppColors.maincolor);
      }


    }
    cartRepo.addToCart(getItems);
    update();

  }

  bool exitsInCart(ProductModal product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  getQuantity(ProductModal product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
      
    }
    return quantity;

  }

  int get totalQuantity {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModal> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalAmount{
    var totalAmount=0;
    _items.forEach((key, value) {
      totalAmount += value.quantity!*value.price!;
    });
    return totalAmount;
  }

  List<CartModal> getCartList(){
    setCart = cartRepo.getCartList();
  return storageItems;
  }

  set setCart(List<CartModal> items){
    storageItems = items;

    for(int i =0;i<storageItems.length;i++){
      _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }
  }

  void getCartHistory(){
    cartRepo.addtoCartHistory();
    clear();
  }

  void clear(){
    _items={};
    update();
  }
}

