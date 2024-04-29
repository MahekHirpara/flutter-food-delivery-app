import 'package:food_app/data/api/api_client.dart';
import 'package:food_app/utils/app_const.dart';
import 'package:get/get.dart';

class UserRepo extends GetxController{
  final ApiClient apiClient;

  UserRepo({required this.apiClient});

  Future<Response> getUserInfo() async{
    return await apiClient.getData(AppConstant.USERINFO_URL);
  }
}