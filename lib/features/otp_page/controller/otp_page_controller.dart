import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/data_model/register_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/core/model/service_model/http_register_result.dart';
import 'package:whole_snack/core/repos/LoginRegisterRepo.dart';
import 'package:whole_snack/core/repos/helper/secure_storage_helper.dart';

class OtpPageController extends GetxController {
  late LoginRegisterRepo loginRegisterRepo;

  late SecureStorageHelper helper;
  OtpPageController() {
    loginRegisterRepo = Get.put(LoginRegisterRepo());
    
    helper = Get.put(SecureStorageHelper());
  }

  getOpt({required String name,required String phone,required String otp}) async {
    HttpRegisterResult<RegisterModel> customResponse = await loginRegisterRepo.otpConfirm(name: name, phone: phone, otp: otp);

    print("token is ${customResponse.mData.customer.cusId}");
    
    if(customResponse.mData.customer.cusId !="" && customResponse.mData.token !="") {
      
     await helper.writeSecureData(key: TOKEN_KEY, value: customResponse.mData.token);
     await helper.writeSecureData(key: CUSTOMER_ID_KEY, value: customResponse.mData.customer.cusId);


      
    }
  }
}
