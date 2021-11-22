import 'package:get/get.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/customer_support/controller/customer_support_page_controller.dart';

class CustomerSupportPageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(CustomerSupportPageController());
    Get.put(SizeConfig());
  }


}