import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/data_model/profile_model.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/core/repos/helper/secure_storage_helper.dart';
import 'package:whole_snack/core/repos/profile_repo.dart';
import 'package:whole_snack/features/cart/controller/cart_controller.dart';
import 'package:whole_snack/features/edit_profile/controller/edit_profile_page_controller.dart';
import 'package:whole_snack/features/edit_profile/view/edit_profile_page.dart';

class AccountController extends GetxController {
  String name = "";

  late ProfileModel model;
  RxBool isLoading = true.obs;
  RxBool isSuccessful = false.obs;

  late SecureStorageHelper helper;

  RxList<ProfileModel> myProfile = RxList();
  late ProfileRepo profileRepo;

  CartController mCartController = Get.find<CartController>();

  fetchData() {
    profileRepo = Get.put(ProfileRepo());

    getProfileInfo();


    //getProfileInfo();
  }

  getProfileInfo() async {
    isSuccessful.value = false;
    print(mCartController.token.value);
    if (mCartController.token.value.isNotEmpty) {
      HttpGetResult<ProfileModel> mData = await profileRepo.getProfile(
          cutomerId: mCartController.customId.value.toString());

      if (mData.isSuccessful) {
        myProfile.addAll(mData.mData);

        isSuccessful.value = true;
      }
    }
  }

  checkoutCheckStatus() {
    if (mCartController.token.value.isNotEmpty) {
      Get.toNamed("/add-address-page");
    }
  }

  logout() async {
    var result = await helper.deleteSecureData(key: TOKEN_KEY);
    await helper.deleteSecureData(key: CUSTOMER_ID_KEY);

    print("log out result is $result");

    Get.toNamed("/sign-up-page");
  }
}
