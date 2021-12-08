
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/widgets/build_custom_button.dart';
import 'package:whole_snack/features/checkout/view/checkout_page.dart';
import 'package:whole_snack/features/feature_main/controller/feature_main_controller.dart';
import 'package:whole_snack/features/item/view/item_page.dart';

import 'build_circle.dart';

class BuildOrderSuccessBody extends StatelessWidget {
  const BuildOrderSuccessBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    FeatureMainController mFeatureMainController = Get.find<FeatureMainController>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BuildCircle(),
            SizedBox(
              height: 16,
            ),
            Text("Your Order is submmited!!!!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: kExtraLargeFontSize16.sp,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 8,
            ),
            Text("Order Id : 4740303 !!!!",
                style:
                TextStyle(color: Colors.grey, fontSize: kLargeFontSize14.sp)),
          ],
        ),
        Column(
          children: [
            BuildCustomButton(
                haveCorner: false,
                action: () {

                  Get.offAllNamed('/');

                  // mFeatureMainController.changeIndex(3);
                  //
                  // for(int i = 0;i<mFeatureMainController.mRouteHistory.length;i++){
                  //   Get.back();
                  // }
                   //mFeatureMainController.changeIndex(0);
                },
                title: "Track your order"),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: (){
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
                // for(int i = 0;i<mFeatureMainController.mRouteHistory.length;i++){
                //   Get.back();
                // }

              },
              child: Text("Continue to Shop other Products",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: kMediumFontSize12.sp)),
            ),
            SizedBox(
              height: 24,
            )
          ],
        ),
      ],
    );
  }
}
