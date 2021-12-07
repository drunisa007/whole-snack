import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/register_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/core/model/service_model/http_register_result.dart';
import 'package:whole_snack/core/repos/LoginRegisterRepo.dart';

class OtpPageController extends GetxController {
  late LoginRegisterRepo loginRegisterRepo;

  OtpPageController() {
    loginRegisterRepo = Get.put(LoginRegisterRepo());
  }

  getOpt({required String name,required String phone,required String otp}) async {
    HttpGetResult<RegisterModel> customResponse = await loginRegisterRepo.otpConfirm(name: name, phone: phone, otp: otp);

    print(customResponse.mData[0].customer.token);
  }
}
