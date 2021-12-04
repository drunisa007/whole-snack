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


  Future<HttpGetResult<ProfileModel>> getProfile({required String cutomerId}) async {
    
    
    HttpCustomResponse response =  await _httpService.getData("customer/profile.php?id=55");

    if(response.isSuccessful) {
      
      
      Map mapProfile = jsonDecode(response.mData);

      String profileData = jsonEncode(mapProfile["profile"]);


      List<ProfileModel> profileModel = profileModelFromJson(profileData);


      return HttpGetResult("", 200, profileModel, true);
    }
    else {

      print("errror");
      return HttpGetResult(response.errorMessage, response.stateCode, [], false);
    }
  }
}