import 'package:get/get.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/edit_profile/controller/edit_profile_page_controller.dart';

class EditProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EditProfilePageController());
    Get.put(SizeConfig());
  }


}