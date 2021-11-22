import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/appbar/simple_app_bar.dart';
import 'package:whole_snack/features/order/controller/order_controller.dart';
import 'package:whole_snack/features/order/view/order_page_all_widget.dart';

class OrderPage extends StatelessWidget {


  SizeConfig sizeConfig  = Get.find<SizeConfig>();
  final controller = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return ScreenUtilInit(
      builder : ()=> Scaffold(
        appBar: getSimpleAppbar("Order History", sizeConfig),
        body: Center(
          child: orderPageAllWidget(context, sizeConfig, controller)
        ),
      ),
    );
  }
}
