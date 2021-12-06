import 'dart:convert';

import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/profile_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/services/http_service.dart';

class ProfileRepo {

  late HttpService _httpService;

  ProfileRepo() {

    _httpService = Get.put(HttpService());
  }


  Future<HttpGetResult<ProfileModel>> getProfile({required int cutomerId}) async {
    
    
    HttpCustomResponse response =  await _httpService.getDataWithHeader("customer/profile.php?id=$cutomerId");

    print("data profile${response.mData}");
    if(response.isSuccessful) {
      
      
      Map mapProfile = jsonDecode(response.mData);

      String profileData = jsonEncode(mapProfile["profile"]);




      List<ProfileModel> profileModel = profileModelFromJson(profileData);


      print("good in profile");
      return HttpGetResult("", 200, profileModel, true);
    }
    else {

      print("error in profile");

      return HttpGetResult(response.errorMessage, response.stateCode, [], false);
    }
  }
}