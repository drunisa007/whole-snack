import 'package:get/get.dart';
import 'package:whole_snack/features/item/controller/item_controller.dart';

class ItemBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ItemController());
  }

}