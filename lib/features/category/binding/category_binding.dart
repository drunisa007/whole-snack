import 'package:get/get.dart';
import 'package:whole_snack/core/repos/type_repo.dart';

class CategoryBinding extends Bindings{
  @override
  void dependencies() {

    Get.find<TypeRepo>();

  }

}