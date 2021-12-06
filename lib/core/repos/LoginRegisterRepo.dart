import 'dart:convert';

import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/register_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/services/http_post_service.dart';

class LoginRegisterRepo {
  late HttpPostService _httpPostService;
 late String mName = "";
  late String mPhone = "";

  LoginRegisterRepo() {
    _httpPostService = Get.put(HttpPostService());
  }

  Future<HttpCustomResponse> register(name,phoneNumber) async {

    mName = name;
    mPhone = phoneNumber;
    HttpCustomResponse getResult = await _httpPostService.register(name,phoneNumber);

    if (getResult.isSuccessful) {
      Map map = jsonDecode(getResult.mData);

      return HttpCustomResponse("", getResult.stateCode, map, true);
    } else {
      return HttpCustomResponse("", getResult.stateCode, 'error', true);
    }
  }
  Future<HttpCustomResponse> otpConfirm(String otp) async {


    print("$mName ha ha ha ");
    HttpCustomResponse getResult = await _httpPostService.sendOtp(mName,mPhone,otp);

    if (getResult.isSuccessful) {
      Map map = jsonDecode(getResult.mData);

      //print(map);

      return HttpCustomResponse("", getResult.stateCode, map, true);
    } else {
      return HttpCustomResponse("", getResult.stateCode, 'error', true);
    }
  }
}
