import 'package:get/get.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/order_success/controller/order_success_controller.dart';

class OrderSuccessBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(OrderSuccessController());
   Get.put(SizeConfig());
  }


}