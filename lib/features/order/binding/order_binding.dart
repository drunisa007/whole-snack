import 'package:get/get.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/order/controller/order_controller.dart';
import 'package:whole_snack/features/order/view/order_page.dart';

class OrderBinding extends Bindings{
  @override
  void dependencies() {

   Get.put(OrderPage());
   Get.put(SizeConfig());
  }

}