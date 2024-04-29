import 'package:food_app/data/api/api_client.dart';
import 'package:food_app/modal/sing_up_modal.dart';
import 'package:food_app/utils/app_const.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient ,  required this.sharedPreferences});
  Future<Response> registration(SingUpModal singUpModal) async{
    return await apiClient.postData(AppConstant.REGISTRATION_URL, singUpModal.toJson());
  }
  Future<Response> login(String email,String password) async{
    return await apiClient.postData(AppConstant.LOGIN_URL, {"email":email,"password":password});
  }

 bool userLoggedIn() {
    return  sharedPreferences.containsKey(AppConstant.TOKEN);
  }


  Future<String> getuserToken() async{
      return await sharedPreferences.getString(AppConstant.TOKEN)??"None";
  }

  Future<bool> usertokenUpdate(String token) async {
    apiClient.token =token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstant.TOKEN, token);
  }

  Future<void> saveNumberandPassword(String number,String password) async {
    try{
      await sharedPreferences.setString(AppConstant.PHONE, number);
      await sharedPreferences.setString(AppConstant.PASSWORD, password);
    }catch(e){
      throw e;
    }
  }

  bool clearShareData(){
    sharedPreferences.remove(AppConstant.TOKEN);
    sharedPreferences.remove(AppConstant.PASSWORD);
    sharedPreferences.remove(AppConstant.PHONE);
     apiClient.token ='';
     apiClient.updateHeader('');
     return true;
  }
}