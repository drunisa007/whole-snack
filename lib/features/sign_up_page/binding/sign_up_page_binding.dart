import 'package:get/get.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/sign_up_page/controller/sign_up_page_controller.dart';

class SignUpPageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(SignUpPageController());
    Get.put(SizeConfig());
  }


}