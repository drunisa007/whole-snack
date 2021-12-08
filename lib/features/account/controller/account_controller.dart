import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/data_model/profile_model.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/core/repos/helper/secure_storage_helper.dart';
import 'package:whole_snack/core/repos/profile_repo.dart';
import 'package:whole_snack/features/edit_profile/controller/edit_profile_page_controller.dart';
import 'package:whole_snack/features/edit_profile/view/edit_profile_page.dart';

class AccountController extends GetxController{



  String name = "";

 late ProfileModel model;


  late SecureStorageHelper helper;
   late dynamic token;
  late int customerId = -1;
  late dynamic id;
  RxList <ProfileModel> myProfile = RxList();
 late ProfileRepo profileRepo;
  AccountController() {

    getToken();
    profileRepo = Get.put(ProfileRepo());



    profileRepo.getProfile(cutomerId: customerId);
    getProfileInfo();

  }
  getToken() async {
    helper = Get.put(SecureStorageHelper());

    token = await helper.readSecureData(key: TOKEN_KEY);

    id = await helper.readSecureData(key: CUSTOMER_ID_KEY);
    customerId = int.parse(id);
    print("Customer id in profile$customerId");

  }

  getProfileInfo () async{


    HttpGetResult<ProfileModel> result  = await profileRepo.getProfile(cutomerId: customerId);


    myProfile.addAll(result.mData);

    name = myProfile[0].cusName;


   // print(myProfile[0].cusName);


  }



  checkoutCheckStatus() async {


    if (token != null) {
      Get.toNamed("/add-address-page");
    } else {
      Get.toNamed("/sign-up-page");
    }
  }

  logout() async{


    helper.deleteSecureData(key: TOKEN_KEY);
    helper.deleteSecureData(key: CUSTOMER_ID_KEY);
    if (token==null) {
      Get.toNamed("/sign-up-page");
    }


  }


}

