import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/appbar/appbar_with_back_arrow.dart';
import 'package:whole_snack/core/widgets/appbar/simple_app_bar.dart';
import 'package:whole_snack/features/add_address/controller/add_address_page_controller.dart';
import 'package:whole_snack/features/add_address/controller/add_address_page_controller.dart';
import 'package:whole_snack/features/add_address/controller/add_address_page_controller.dart';
import 'package:whole_snack/features/add_address/controller/add_address_page_controller.dart';
import 'package:whole_snack/features/add_address/view/add_addres_page_all_widget.dart';

class AddAddressPage extends StatelessWidget {

  SizeConfig sizeConfig = Get.find<SizeConfig>();
  final controller = Get.find<AddAddressPageController>();
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return ScreenUtilInit(builder: () => Scaffold(
      appBar: getAppBarWithBackArrow("Add New Address", sizeConfig, ()=>Get.back()),

      body:addAddressPageAllWidget(context, sizeConfig, controller),
    ));
  }
}
