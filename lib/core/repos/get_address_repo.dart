import 'dart:convert';

import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/address_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/services/http_service.dart';

class GetAddressRepo {

  
  late HttpService _httpService;
  
  GetAddressRepo() {
    
    _httpService = Get.put(HttpService());
  }
  
  Future<HttpGetResult<AddressModel>> getAddress({required String customerId}) async{
    
    
    
    HttpCustomResponse result = await _httpService.getData("customer/selectaddress.php?cusid=$customerId");


    if(result.isSuccessful) {


      Map addressMap = jsonDecode(result.mData);
      String data = jsonEncode(addressMap["output"]["data"]);
      List<AddressModel> addressList = addressModelFromJson(data);

      return HttpGetResult("", 200, addressList, true);
    } else {

      return HttpGetResult(result.errorMessage, result.stateCode, result.mData, false);
    }
    
  }

}