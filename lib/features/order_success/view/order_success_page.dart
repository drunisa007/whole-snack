import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/order_success/view/order_success_all_widget.dart';

class OrderSuccessPage extends StatelessWidget {



  SizeConfig sizeConfig = Get.find<SizeConfig>();

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return ScreenUtilInit(
       builder: () =>Scaffold(

        body:  orderSuccessAllWidget(context,sizeConfig)
      ),
    );
  }
}
