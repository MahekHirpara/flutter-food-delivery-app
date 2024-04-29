import 'dart:convert';

import 'package:food_app/data/repository/auth_repo.dart';
import 'package:food_app/modal/response_modal.dart';
import 'package:food_app/modal/sing_up_modal.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService{
  final AuthRepo authRepo;

  AuthController({ required this.authRepo});

  bool _isloading = false;
  bool get isLoding => _isloading;

  Future<ResponseModal> registration(SingUpModal singUpModal) async{
    _isloading = true;
    update();
   Response response = await authRepo.registration(singUpModal);
   late ResponseModal responseModal;
   if(response.statusCode == 200){
    authRepo.usertokenUpdate(response.body["token"]);
    responseModal = ResponseModal(true,response.body["token"] );
   }else{
     responseModal = ResponseModal(false,response.statusText );
   }
   _isloading=false;
   update();
   return responseModal;
  }

  Future<ResponseModal> login(String email,String password) async{
    _isloading = true;
    update();
    Response response = await authRepo.login(email,password);
    late ResponseModal responseModal;
    if(response.statusCode == 200){
      authRepo.usertokenUpdate(response.body["token"]);
      print(response.body['token'].toString());
      responseModal = ResponseModal(true,response.body["token"] );
    }else{
      responseModal = ResponseModal(false,response.statusText );
    }
    _isloading=false;
    update();
    return responseModal;
  }

  void saveNumberandPassword(String number,String password)  {
    authRepo.saveNumberandPassword(number, password);
  }

  bool userLoggedIn(){
    return authRepo.userLoggedIn();
  }

  bool clearShareData(){
    return authRepo.clearShareData();
  }
}