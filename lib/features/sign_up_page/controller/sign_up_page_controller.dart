import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/register_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';

import 'package:whole_snack/core/repos/LoginRegisterRepo.dart';


class SignUpPageController extends GetxController {

  late LoginRegisterRepo loginRegisterRepo;
 bool isSuccessful = false;
 bool isLoading = true;





 List<RegisterModel> list = [];


  SignUpPageController() {


    loginRegisterRepo = Get.put(LoginRegisterRepo());


    print("Be Bat Be Bat ha Ha ha Sign Up page ");
  }

  getLoginData(name,phoneNumber)  async{

   // HttpGetResult<RegisterModel> result  =

    HttpCustomResponse customResponse =  await loginRegisterRepo.register(name,phoneNumber);

    if(customResponse.stateCode != 200) {

      isLoading = true;
    }





    isSuccessful = customResponse.isSuccessful;

    print(isSuccessful);





  }
}