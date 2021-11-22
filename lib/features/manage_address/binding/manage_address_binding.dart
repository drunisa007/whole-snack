import 'package:get/get.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/manage_address/controller/manage_address_controller.dart';

class ManageAddrssBinding extends Bindings {
  @override
  void dependencies() {

    Get.put(ManageAddressController());
    Get.put(SizeConfig());
  }


}