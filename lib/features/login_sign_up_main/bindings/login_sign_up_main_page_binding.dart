import 'package:get/get.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/login_sign_up_main/controller/login_sign_up_main_page_controller.dart';

class LoginSignUpMainPageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(LoginSignUpMainPageController());
    Get.put(SizeConfig());
  }


}