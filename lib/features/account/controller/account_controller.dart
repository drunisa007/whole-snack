import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/profile_model.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/core/repos/profile_repo.dart';

class AccountController extends GetxController{


  String customerId = "56";
  RxList <ProfileModel> myProfile = RxList();
 late ProfileRepo profileRepo;
  AccountController() {

    profileRepo = Get.put(ProfileRepo());
    
    profileRepo.getProfile(cutomerId: "56");
    getProfileInfo();

  }

  getProfileInfo () async{


    HttpGetResult<ProfileModel> result  = await profileRepo.getProfile(cutomerId: customerId);


    myProfile.addAll(result.mData);







  }

}