import 'package:get/get.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/repos/LoginRegisterRepo.dart';

class OtpPageController extends GetxController {
  late LoginRegisterRepo loginRegisterRepo;

  OtpPageController() {
    loginRegisterRepo = Get.put(LoginRegisterRepo());
  }

  getOpt(String otp) async {
    HttpCustomResponse customResponse = await loginRegisterRepo.otpConfirm(otp);
  }
}
