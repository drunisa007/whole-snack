
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/appbar/appbar_with_back_arrow.dart';
import 'package:whole_snack/features/customer_support/controller/customer_support_page_controller.dart';
import 'package:whole_snack/features/customer_support/view/customer_support_page_all_widget.dart';

class CustomerSupportPage extends StatelessWidget {


  SizeConfig sizeConfig = Get.find<SizeConfig>();
  final controller = Get.find<CustomerSupportPageController>();
  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return ScreenUtilInit(builder: () =>

    Scaffold(
      appBar: getAppBarWithBackArrow("Customer Support", sizeConfig, ()=>Get.back()),
      body: SingleChildScrollView(child: customerSupportPageAllWidget(context, sizeConfig, controller)),
    )
    );
  }
}
