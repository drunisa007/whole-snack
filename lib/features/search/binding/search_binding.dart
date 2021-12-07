import 'package:get/get.dart';
import 'package:whole_snack/core/repos/search_repo.dart';
import 'package:whole_snack/features/search/controller/search_controller.dart';

class SearchBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut(() => SearchController());
    Get.lazyPut(() => SearchRepo());
  }

}