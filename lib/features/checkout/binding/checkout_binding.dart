import 'package:get/get.dart';
import 'package:whole_snack/core/repos/order_repo.dart';
import 'package:whole_snack/features/checkout/controller/checkout_controller.dart';

class CheckOutBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut(() => CheckOutController());

    Get.lazyPut(() => OrderRepo());

  }

}