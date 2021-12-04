import 'dart:convert';

import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/category_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/services/http_service.dart';

class CategoryRepo{

  late HttpService _httpService;

  CategoryRepo(){
    _httpService = Get.put(HttpService());
  }

  Future<HttpGetResult<CategoryModel>>  getCategory() async {
    HttpCustomResponse result = await _httpService.getData("Category/index.php?view=all");
    if(result.isSuccessful){
      Map tempJson = jsonDecode(result.mData);
      String tempData = jsonEncode(tempJson["output"]["data"]);
      List<CategoryModel> parseData = categoryModelFromJson(tempData);
      return HttpGetResult('', 200, parseData, true);
    }
    else{
      return HttpGetResult(result.errorMessage, result.stateCode,[], false);
    }
  }
}