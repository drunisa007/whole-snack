import 'package:get/get.dart';
import 'package:whole_snack/core/repos/helper/secure_storage_helper.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/otp_page/controller/otp_page_controller.dart';

class OtpPageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(OtpPageController());
    Get.lazyPut(() => SecureStorageHelper());
    Get.put(SizeConfig());
  }


}