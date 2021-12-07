import 'dart:convert';

import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/item_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/services/http_service.dart';

class SearchRepo{
  late HttpService _httpService;

  SearchRepo(){
    _httpService = Get.put(HttpService());
  }

  Future<HttpGetResult<ItemModel>>  getItemList() async {
    HttpCustomResponse result = await _httpService.getData("Item/getallitem.php");
    if(result.isSuccessful){
      Map tempJson = jsonDecode(result.mData);
      String tempData = jsonEncode(tempJson["output"]["data"]);
      List<ItemModel> parseData = itemModelFromJson(tempData);
      return HttpGetResult("success", 200, parseData, true);
    }
    else{
      return HttpGetResult(result.errorMessage, result.stateCode,[], false);
    }
  }
}