import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/profile_model.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/core/repos/profile_repo.dart';
import 'package:whole_snack/features/edit_profile/controller/edit_profile_page_controller.dart';
import 'package:whole_snack/features/edit_profile/view/edit_profile_page.dart';

class AccountController extends GetxController{


  int customerId = 56;
  String name = "";

  RxList <ProfileModel> myProfile = RxList();
 late ProfileRepo profileRepo;
  AccountController() {

    profileRepo = Get.put(ProfileRepo());

    
    profileRepo.getProfile(cutomerId: customerId);
    getProfileInfo();

  }

  getProfileInfo () async{


    HttpGetResult<ProfileModel> result  = await profileRepo.getProfile(cutomerId: customerId);


    myProfile.addAll(result.mData);

    name = myProfile[0].cusName;



   // print(myProfile[0].cusName);


  }



}

