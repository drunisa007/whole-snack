import 'package:get/get.dart';
import 'package:whole_snack/core/repos/item_detail_repo.dart';
import 'package:whole_snack/features/item/controller/item_controller.dart';

class ItemBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ItemController());
    Get.lazyPut(() => ItemDetailRepo());
  }

}