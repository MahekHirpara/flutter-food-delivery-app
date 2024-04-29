import 'package:food_app/data/repository/recommened_food_repo.dart';
import 'package:food_app/modal/popular_food_modal.dart';
import 'package:get/get.dart';


class RecommadedFoodController extends GetxController {
  final RecommendedFoodRepo recommendedFoodRepo;
  RecommadedFoodController({required this.recommendedFoodRepo});

  List<dynamic> _recomededproductList = [];
  List<dynamic> get recomededproductList => _recomededproductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> recommenedProductList() async {
    Response response = await recommendedFoodRepo.getRecommenedList();
    if (response.statusCode == 200) {
      _recomededproductList = [];
      _recomededproductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }
}
