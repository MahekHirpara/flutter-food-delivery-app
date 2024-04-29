import 'package:food_app/controller/cart_controller.dart';
import 'package:food_app/data/repository/popular_food_repo.dart';
import 'package:food_app/modal/cart_modal.dart';
import 'package:food_app/modal/popular_food_modal.dart';
import 'package:food_app/utils/colors.dart';
import 'package:get/get.dart';

class PopulerFoodController extends GetxController {
  final PopulerFoodRepo populerFoodRepo;
  PopulerFoodController({required this.populerFoodRepo});
  List<dynamic> _populerFoodList = [];
  List<dynamic> get populerFoodList => _populerFoodList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _cartItems =0;
  int get cartItems => _cartItems+quantity;



  Future<void> PopulerFoodList() async {
    Response response = await populerFoodRepo.populerFoodList();
    if (response.statusCode == 200) {
      _populerFoodList=[];
      _populerFoodList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    }else{
      print('Error: ${response.statusCode}');
    }

  }

  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity = checkQuantity(_quantity + 1);
    }else{
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }



  int checkQuantity(int quantity) {
    if ((_cartItems+quantity) < 0) {
      Get.snackbar('Iteam Count', 'You can not decrese now',
          backgroundColor: AppColors.maincolor);
      return 0;
    } else if ((_cartItems+quantity) > 20) {
      Get.snackbar('Iteam Count', 'You can not Increase now');
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModal product, CartController cart) {

    _quantity = 0;
    _cartItems=0;
    _cart = cart;
    var exit = false;
    exit = _cart.exitsInCart(product);

    if(exit){
      _cartItems = _cart.getQuantity(product);
    }


  }

  void addIteams(ProductModal product) {
    // if ((_cartItems+_quantity) > 0) {
      _cart.addIteams(product, _quantity);
      _quantity=0;
      _cartItems = _cart.getQuantity(product);
      _cart.items.forEach((key, value) {

      });
      update();
  //   } else {
  //     Get.snackbar('Add Items', 'add Items',
  //         backgroundColor: AppColors.maincolor);
  //   }
  //
  }

  int get totalQuantity {
    return _cart.totalQuantity;
  }

  List<CartModal> get getItems {
    return _cart.getItems;
  }
}