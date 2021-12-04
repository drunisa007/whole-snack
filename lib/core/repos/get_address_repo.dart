import 'dart:convert';

import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/address_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/services/http_post_service.dart';
import 'package:whole_snack/services/http_service.dart';

class GetAddressRepo {

  
  late HttpService _httpService;
  late HttpPostService _httpPostService;
  
  GetAddressRepo() {
    
    _httpService = Get.put(HttpService());
    _httpPostService = Get.put(HttpPostService());
  }
  
  Future<HttpGetResult<AddressModel>> getAddress({required String customerId}) async{
    
    
    
    HttpCustomResponse result = await _httpService.getDataWithHeader("customer/selectaddress.php?cusid=$customerId");


    if(result.isSuccessful) {


      Map addressMap = jsonDecode(result.mData);
      String data = jsonEncode(addressMap["output"]["data"]);
      List<AddressModel> addressList = addressModelFromJson(data);

      return HttpGetResult("", 200, addressList, true);
    } else {

      return HttpGetResult(result.errorMessage, result.stateCode, [], false);
    }
    
  }

  Future<HttpCustomResponse> deleteAddress(AddressModel model) async {

    print(model);
    HttpCustomResponse response = await _httpPostService.deleteAddress(model);

    if (response.isSuccessful) {
      Map map = jsonDecode(response.mData);

      return HttpCustomResponse("", response.stateCode, map, true);
    } else {
      return HttpCustomResponse("", response.stateCode, 'error', true);
    }

  }



}