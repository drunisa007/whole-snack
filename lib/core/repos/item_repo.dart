import 'dart:convert';

import 'package:get/get.dart';
import 'package:whole_snack/core/model/item_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/services/http_service.dart';
class ItemRepo{

  late HttpService _httpService;

  ItemRepo(){
    _httpService = Get.put(HttpService());
  }

  Future<HttpGetResult<ItemModel>>  getItem(categoryId,typeId) async {
    HttpCustomResponse result = await _httpService.getData("Item/?catid=$categoryId&typeid=$typeId&page=1");
    if(result.isSuccessful){
      Map tempJson = jsonDecode(result.mData);
      String tempData = jsonEncode(tempJson["output"]["data"]);
      List<ItemModel> parseData = itemModelFromJson(tempData);
      return HttpGetResult('', 200, parseData, true);
    }
    else{
      return HttpGetResult(result.errorMessage, result.stateCode,result.mData, false);
    }
  }
}