import 'package:food_app/data/repository/user_repo.dart';
import 'package:food_app/modal/response_modal.dart';
import 'package:food_app/modal/user_modal.dart';
import 'package:get/get.dart';

class UserController extends GetxController{

  final UserRepo userRepo;

  UserController({required this.userRepo});


  bool _isLoading = false;
  late UserModal _userModal;

  bool get isLoding => _isLoading;
  UserModal get userModal =>_userModal;


  Future<ResponseModal> getUserInfo() async{
    Response response = await userRepo.getUserInfo();
    late ResponseModal responseModal;
      if(response.statusCode == 200){
        _userModal = UserModal.fromJson(response.body);
       _isLoading = true;
        responseModal = ResponseModal(true,"successfully");
      }else{
        responseModal = ResponseModal(false,response.statusText );
      }

    update();
    return responseModal;
  }
}