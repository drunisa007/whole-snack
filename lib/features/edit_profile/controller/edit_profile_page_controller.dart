import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/profile_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/repos/profile_repo.dart';

class EditProfilePageController extends GetxController {

  RxString name=RxString("");
  late ProfileRepo _repo;

  EditProfilePageController() {

    _repo = Get.put(ProfileRepo());

  }

  updateProfile(ProfileModel model) async{

    HttpCustomResponse response = await  _repo.updateProfile(model);

    print(response);
  }



}