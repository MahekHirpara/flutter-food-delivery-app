import 'package:food_app/data/api/api_client.dart';
import 'package:food_app/utils/app_const.dart';
import 'package:get/get.dart';


class RecommendedFoodRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedFoodRepo({required this.apiClient});

  Future<Response> getRecommenedList() async {
    return await apiClient.getData(AppConstant.RECOMMANDED_PRODUCT_URL);
  }
}