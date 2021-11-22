import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/appbar/simple_app_bar.dart';
import 'package:whole_snack/features/order/view/order_page_all_widget.dart';
import 'package:whole_snack/features/order_detail/controller/order_detail_page_controller.dart';
import 'package:whole_snack/features/order_detail/view/order_detail_page_all_widget.dart';

class OrderDetailPage extends StatelessWidget {


  SizeConfig sizeConfig = Get.find<SizeConfig>();
  final  controller = Get.find<OrderDetailPageController>();

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return ScreenUtilInit(builder: () => Scaffold(
      appBar: getSimpleAppbar("Order Detail", sizeConfig),
      body: orderDetailPageAllWidget(context, sizeConfig, controller)
    ));
  }
}
