import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/add_address_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/services/http_service.dart';

class AddAddressRepo {

  late HttpService _httpService;

  AddAddressRepo (){

    _httpService = Get.put(HttpService());

  }

  Future<void> postAddresData(AddAddressModel addressModel) async {

  //  HttpCustomResponse response = await _httpPostService.postAddress(addressModel);
  }
}