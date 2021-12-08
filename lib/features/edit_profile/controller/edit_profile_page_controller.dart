import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/data_model/profile_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/repos/helper/secure_storage_helper.dart';
import 'package:whole_snack/core/repos/profile_repo.dart';
import 'package:whole_snack/core/widgets/loading_dialog.dart';

class EditProfilePageController extends GetxController {


  late ProfileRepo _repo;

  RxBool isLoading = true.obs;
  RxBool isSuccessful  = false.obs;
  late SecureStorageHelper helper;
  EditProfilePageController() {

    _repo = Get.put(ProfileRepo());

  }

  updateProfile(ProfileModel model,context) async{

    isLoading.value = true;
    showLoaderDialog(context);
    HttpCustomResponse response = await  _repo.updateProfile(model);


    isLoading.value =false;

    Get.back();
    if(response.isSuccessful) {

      isSuccessful.value = true;
      Get.back();
    }
    else {

      isSuccessful.value = false;
    }
  }





}