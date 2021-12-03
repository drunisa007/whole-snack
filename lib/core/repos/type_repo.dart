import 'dart:convert';

import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/type_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/services/http_service.dart';

class TypeRepo{

  late HttpService _httpService;

  TypeRepo(){
    _httpService = Get.put(HttpService());
  }

  Future<HttpGetResult<TypeModel>>  getType(categoryId) async {
    HttpCustomResponse result = await _httpService.getData("Type/?view=$categoryId");
    if(result.isSuccessful){
      Map tempJson = jsonDecode(result.mData);
      String tempData = jsonEncode(tempJson["output"]["data"]);
      List<TypeModel> parseData = typeModelFromJson(tempData);
      return HttpGetResult('', 200, parseData, true);
    }
    else{
      return HttpGetResult(result.errorMessage, result.stateCode,[], false);
    }
  }
}