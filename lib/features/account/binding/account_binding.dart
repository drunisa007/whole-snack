import 'package:get/get.dart';
import 'package:whole_snack/features/account/controller/account_controller.dart';

class AccoutBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(AccountController());
  }

}