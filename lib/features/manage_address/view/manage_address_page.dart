import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/appbar/appbar_with_back_arrow.dart';
import 'package:whole_snack/features/manage_address/controller/manage_address_controller.dart';
import 'package:whole_snack/features/manage_address/view/manage_address_page_all_widget.dart';

class ManageAddressPage extends StatelessWidget {


final  sizeConfig = Get.find<SizeConfig>();
  final controller = Get.find<ManageAddressController>();

  @override
  Widget build(BuildContext context) {

    sizeConfig.init(context);
    return ScreenUtilInit(builder: () =>
    Scaffold(
      appBar: getAppBarWithBackArrow("Manage Addrss", sizeConfig, ()=> Get.back()),
      body: manageAddressPageAllWidget(context,sizeConfig, controller)
    )
    );
  }
}
