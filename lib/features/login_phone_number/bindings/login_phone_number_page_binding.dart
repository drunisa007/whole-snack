import 'package:get/get.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/login_phone_number/controller/login_phone_number_page_controller.dart';

class LoginPhoneNumberPageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(LoginPhoneNumberPageController());
    Get.put(SizeConfig());
  }


}