import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/data_model/register_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/core/model/service_model/http_register_result.dart';
import 'package:whole_snack/core/repos/LoginRegisterRepo.dart';
import 'package:whole_snack/core/repos/helper/secure_storage_helper.dart';
import 'package:whole_snack/core/widgets/loading_dialog.dart';

class OtpPageController extends GetxController {
  late LoginRegisterRepo loginRegisterRepo;

  late SecureStorageHelper helper;
  RxBool isLoading = true.obs;
  RxString errorMessage = RxString("");

  RxString token = RxString("");

  OtpPageController() {
    loginRegisterRepo = Get.put(LoginRegisterRepo());

    helper = Get.put(SecureStorageHelper());
  }

  getOpt(
      {required String name,
      required String phone,
      required String otp,
      required context}) async {
    isLoading.value = true;

    showLoaderDialog(context);
    HttpRegisterResult<RegisterModel> customResponse =
        await loginRegisterRepo.otpConfirm(name: name, phone: phone, otp: otp);

    print("token is ${customResponse.mData.customer.cusId}");
    isLoading.value = false;
    Get.back();

    if (customResponse.mData.customer.cusId.isNotEmpty &&
        customResponse.mData.token.isNotEmpty) {
      errorMessage.value = "";

      await helper.writeSecureData(
          key: TOKEN_KEY, value: customResponse.mData.token);
      await helper.writeSecureData(
          key: CUSTOMER_ID_KEY, value: customResponse.mData.customer.cusId);

      var loginToken = await helper.writeSecureData(
          key: TOKEN_KEY, value: customResponse.mData.token);

      token.value = loginToken.toString();

      if (token.value.isNotEmpty) {
        Get.back();
        Get.back();
        Get.back();
      } else {
        print("$token is token");
      }
    } else {
      errorMessage.value = "Something Wrong";
    }
  }
}
