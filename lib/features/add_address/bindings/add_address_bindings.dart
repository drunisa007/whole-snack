import 'package:get/get.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/add_address/controller/add_address_page_controller.dart';

class AddAddresPageBindings extends Bindings {
  @override
  void dependencies() {
   Get.put(AddAddressPageController());
   Get.put(SizeConfig());
  }


}