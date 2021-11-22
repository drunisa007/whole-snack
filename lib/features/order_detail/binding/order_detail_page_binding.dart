import 'package:get/get.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/order_detail/controller/order_detail_page_controller.dart';

class OrderDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(OrderDetailPageController());
    Get.put(SizeConfig());
  }


}