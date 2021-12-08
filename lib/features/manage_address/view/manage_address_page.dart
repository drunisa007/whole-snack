import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/appbar/appbar_with_back_arrow.dart';
import 'package:whole_snack/features/manage_address/controller/manage_address_controller.dart';
import 'package:whole_snack/features/manage_address/view/manage_address_page_all_widget.dart';

class ManageAddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final  sizeConfig = Get.find<SizeConfig>();
    sizeConfig.init(context);

    ManageAddressController controller = Get.find<ManageAddressController>();
    controller.getMyAddress();

    return Scaffold(
        appBar: getAppBarWithBackArrow("Manage Address", sizeConfig, ()=> Get.back()),
        body: ManageAddressPageAllWidget()
    );
  }
}
