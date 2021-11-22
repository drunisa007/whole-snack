import 'package:get/get.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/about_page/controller/about_page_controller.dart';

class AboutPageBinding extends Bindings {
  @override
  void dependencies() {

    Get.put(AboutPageController());
    Get.put(SizeConfig());
  }


}