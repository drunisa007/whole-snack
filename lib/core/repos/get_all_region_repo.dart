import 'dart:convert';

import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/region_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/services/http_service.dart';

class GetAllRegionRepo {
  //region/?view=all

  late HttpService _httpService;
  
  GetAllRegionRepo() {
    
    _httpService = Get.put(HttpService());
  }


 Future<HttpGetResult<RegionModel>> getTownshipList() async{


    HttpCustomResponse result =  await _httpService.getData('region/?view=all');

    if(result.isSuccessful) {

      Map jsonRegion= jsonDecode(result.mData);
      String regionData = jsonEncode(jsonRegion["output"]["data"]);
      List<RegionModel> townshipList = regionModelFromJson(regionData);


      return HttpGetResult('success', 200, townshipList, true);




    }
     else {

       return HttpGetResult(result.errorMessage, result.stateCode, result.mData, false);
    }

 }
  
  
}