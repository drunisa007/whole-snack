import 'package:get/get.dart';
import 'package:whole_snack/core/repos/category_repo.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.find<CategoryRepo>();
  }

}