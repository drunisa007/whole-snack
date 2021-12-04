import 'dart:convert';

import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/item_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/services/http_service.dart';
class ItemRepo{

  late HttpService _httpService;

  ItemRepo(){
    _httpService = Get.put(HttpService());
  }

  Future<HttpGetResult<ItemModel>>  getItemList(categoryId,page) async {
    HttpCustomResponse result = await _httpService.getData("Item/?categoryid=$categoryId&page=$page");
    if(result.isSuccessful){
      Map tempJson = jsonDecode(result.mData);
      String tempData = jsonEncode(tempJson["output"]["data"]);
      List<ItemModel> parseData = itemModelFromJson(tempData);
      return HttpGetResult(tempJson["output"]["last_page"].toString(), 200, parseData, true);
    }
    else{
      return HttpGetResult(result.errorMessage, result.stateCode,[], false);
    }
  }

  Future<HttpGetResult<ItemModel>>  getItem(categoryId,typeId,page) async {
    HttpCustomResponse result = await _httpService.getData("Item/?catid=$categoryId&typeid=$typeId&page=1");
    if(result.isSuccessful){
      Map tempJson = jsonDecode(result.mData);
      String tempData = jsonEncode(tempJson["output"]["data"]);
      List<ItemModel> parseData = itemModelFromJson(tempData);
      return HttpGetResult(tempJson["output"]["last_page"].toString(), 200, parseData, true);
    }
    else{
      return HttpGetResult(result.errorMessage, result.stateCode,[], false);
    }
  }
}