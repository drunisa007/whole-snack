import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/appbar/simple_app_bar.dart';
import 'package:whole_snack/features/order/controller/order_controller.dart';
import 'package:whole_snack/features/order/view/order_page_all_widget.dart';

class OrderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SizeConfig sizeConfig  = Get.find<SizeConfig>();

    sizeConfig.init(context);
    final controller = Get.find<OrderController>();
    controller.FetchOrderController();
    return Scaffold(
      appBar: SimpleAppBar(title: "Order History",haveBackArrow: false,action: ()=> print("good"),),
      body: Center(
          child: orderPageAllWidget(context, sizeConfig, controller)
      ),
    );
  }
}
