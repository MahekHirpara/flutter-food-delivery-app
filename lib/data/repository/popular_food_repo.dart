import 'package:food_app/data/api/api_client.dart';
import 'package:food_app/utils/app_const.dart';
import 'package:get/get.dart';


class PopulerFoodRepo extends GetxService {
  final ApiClient apiClient;

  PopulerFoodRepo({required this.apiClient});

  Future<Response> populerFoodList() async {
    return await apiClient.getData(AppConstant.POPULAR_PRODUCT_URL);
  }
}
