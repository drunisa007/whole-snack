import 'package:get/get.dart';
import 'package:whole_snack/core/repos/category_repo.dart';
import 'package:whole_snack/core/repos/item_repo.dart';
import 'package:whole_snack/core/repos/register_repo.dart';
import 'package:whole_snack/core/repos/type_repo.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/account/controller/account_controller.dart';
import 'package:whole_snack/features/cart/controller/cart_controller.dart';
import 'package:whole_snack/features/category/controller/category_controller.dart';
import 'package:whole_snack/features/feature_main/controller/feature_main_controller.dart';
import 'package:whole_snack/features/home/controller/home_controller.dart';
import 'package:whole_snack/features/order/controller/order_controller.dart';

class FeatureMainBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FeatureMainController());
    Get.lazyPut(() => RegisterRepo());
    Get.lazyPut(() => SizeConfig());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CategoryRepo());
    Get.lazyPut(() => CategoryController());
    Get.lazyPut(() => TypeRepo());
    Get.lazyPut(() => ItemRepo());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => OrderController());
    Get.lazyPut(() => AccountController());
  }

}