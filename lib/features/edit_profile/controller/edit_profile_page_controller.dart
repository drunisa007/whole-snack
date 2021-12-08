import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/data_model/profile_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/repos/helper/secure_storage_helper.dart';
import 'package:whole_snack/core/repos/profile_repo.dart';

class EditProfilePageController extends GetxController {

  RxString name=RxString("");
  late ProfileRepo _repo;
  late int customerId;
  late dynamic token;
  late SecureStorageHelper helper;
  EditProfilePageController() {

    _repo = Get.put(ProfileRepo());

  }

  updateProfile(ProfileModel model) async{

    HttpCustomResponse response = await  _repo.updateProfile(model);

    print(response);
  }



  getToken() async {
    helper = Get.put(SecureStorageHelper());

    token = await helper.readSecureData(key: TOKEN_KEY);

    dynamic id = await helper.readSecureData(key: CUSTOMER_ID_KEY);
    customerId = int.parse(id);
    print("Customer id in profile$customerId");

  }

}