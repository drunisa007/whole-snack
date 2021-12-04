import 'dart:convert';

import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/item_detail_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/services/http_service.dart';

class ItemDetailRepo{

  late HttpService _httpService;

  ItemDetailRepo(){
    _httpService = Get.put(HttpService());
  }

  Future<HttpGetResult<ItemDetailModel>>  getItemDetail(itemId) async {
    HttpCustomResponse result = await _httpService.getData("Item/?itemid=$itemId");

    if(result.isSuccessful){
      Map tempJson = jsonDecode(result.mData);
      String tempData = jsonEncode(tempJson["output"]);
      List<ItemDetailModel> parseData = itemDetailModelFromJson(tempData);
      return HttpGetResult('', 200, parseData, true);
    }
    else{
      return HttpGetResult(result.errorMessage, result.stateCode,[], false);
    }
  }
}