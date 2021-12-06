import 'package:get/get.dart';
import 'package:whole_snack/core/repos/get_all_region_repo.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/add_address/controller/add_address_page_controller.dart';
import 'package:whole_snack/features/manage_address/controller/manage_address_controller.dart';

class AddAddresPageBindings extends Bindings {
  @override
  void dependencies() {
   Get.put(AddAddressPageController());
   Get.put(SizeConfig());
   Get.put(ManageAddressController());

  }


}