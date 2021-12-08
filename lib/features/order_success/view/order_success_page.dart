import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/feature_main/controller/feature_main_controller.dart';
import 'package:whole_snack/features/feature_main/view/feature_main.dart';
import 'package:whole_snack/features/order_success/view/order_success_all_widget.dart';

class OrderSuccessPage extends StatelessWidget {




  @override
  Widget build(BuildContext context) {

    SizeConfig sizeConfig = Get.find<SizeConfig>();

    sizeConfig.init(context);

    FeatureMainController mFeatureMainController  = Get.find<FeatureMainController>();


    return WillPopScope(onWillPop: () async {

      Get.offAllNamed('/');
      // if(mFeatureMainController.startRoute.value=="home"){
      //   mFeatureMainController.changeIndex(0);
      // }
      // else if(mFeatureMainController.startRoute.value == "category"){
      //   mFeatureMainController.changeIndex(1);
      // }
      // else{
      //   mFeatureMainController.changeIndex(2);
      // }
      //
      // mFeatureMainController.pushNewRoutesHistory();
      // for(int i = 0;i<mFeatureMainController.mRouteHistory.length;i++){
      //   Get.back();
      // }
      return true;
    }, child: Scaffold(

        body:  orderSuccessAllWidget(context,sizeConfig)

    ),

    );
  }
}
