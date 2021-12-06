import 'dart:convert';

import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/add_address_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/services/http_post_service.dart';
import 'package:whole_snack/services/http_service.dart';

class AddAddressRepo {

  late HttpPostService _httpPostService;

  AddAddressRepo (){

    _httpPostService = Get.put(HttpPostService());

  }

  Future<HttpCustomResponse> addAddresData(AddAddressModel addressModel) async {

    HttpCustomResponse response = await _httpPostService.postAddress(addressModel);
    if (response.isSuccessful) {


      return HttpCustomResponse("", response.stateCode, response.stateCode, true);
    } else {
      return HttpCustomResponse("", response.stateCode, 'error', true);
    }
  }

  Future<HttpCustomResponse> updateAddresData(AddAddressModel addressModel) async {

    HttpCustomResponse response = await _httpPostService.postAddress(addressModel);
    if (response.isSuccessful) {


      return HttpCustomResponse("", response.stateCode, response.stateCode, true);
    } else {
      return HttpCustomResponse("", response.stateCode, 'error', true);
    }
  }


}