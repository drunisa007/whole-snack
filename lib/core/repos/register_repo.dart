
import 'package:get/get.dart';
import 'package:whole_snack/core/model/register_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/model/service_model/http_register_result.dart';
import 'package:whole_snack/services/http_service.dart';

class RegisterRepo {

  late HttpService _httpService;

  RegisterRepo() {
    _httpService = Get.put(HttpService());
  }

  Future<HttpRegisterResult<RegisterModel>> getRegister() async {
    HttpCustomResponse result = await _httpService.getData(
        "customer/register.php");
    if (result.isSuccessful) {
      RegisterModel parseData = registerModelFromJson(result.mData);
      return HttpRegisterResult('', 200, parseData, true);
    }
    else {
      return HttpRegisterResult(
          result.errorMessage, result.stateCode, result.mData, false);
    }
  }
}