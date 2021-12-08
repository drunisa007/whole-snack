import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/register_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';

import 'package:whole_snack/core/repos/LoginRegisterRepo.dart';
import 'package:whole_snack/core/widgets/loading_dialog.dart';

class SignUpPageController extends GetxController {
  late LoginRegisterRepo loginRegisterRepo;
  RxBool isSuccessful = false.obs;
  bool isLoading = true;

  List<RegisterModel> list = [];

  SignUpPageController() {
    loginRegisterRepo = Get.put(LoginRegisterRepo());

    print("Be Bat Be Bat ha Ha ha Sign Up page ");
  }

  getLoginData(name, phoneNumber,context) async {
    // HttpGetResult<RegisterModel> result  =
    isLoading = true;
    showLoaderDialog(context);
    HttpCustomResponse customResponse =
        await loginRegisterRepo.register(name, phoneNumber);
    isSuccessful.value = customResponse.isSuccessful;



    print(customResponse.mData);

    if (isSuccessful.value) {
      Get.back();

      Get.toNamed("/otp-page",arguments: [name,phoneNumber]);
      print(isSuccessful.value);
    }
  }
}
