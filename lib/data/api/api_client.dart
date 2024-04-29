import 'package:food_app/utils/app_const.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeader;
  // late  SharedPreferences sharedPreferences;
  ApiClient({required this.appBaseUrl,}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = AppConstant.TOKEN;
    _mainHeader = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }
  updateHeader(String token){
    _mainHeader = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }
  Future<Response> getData(String baseUrl,{ Map<String,String>? headers }) async {
    try {
      Response response = await get(baseUrl,headers: headers??_mainHeader);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
  Future<Response> postData(String baseUrl, dynamic data) async {

    try{
      Response response = await post(baseUrl,data,headers: _mainHeader);
      return response;

    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}