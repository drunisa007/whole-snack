import 'package:get/get.dart';
import 'package:whole_snack/features/account/controller/account_controller.dart';
import 'package:whole_snack/features/edit_profile/controller/edit_profile_page_controller.dart';
import 'package:whole_snack/features/edit_profile/view/edit_profile_page.dart';

class AccoutBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(AccountController());

  }

}