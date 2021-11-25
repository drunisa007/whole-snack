import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/appbar/simple_app_bar.dart';
import 'package:whole_snack/features/cart/view/build_checkout.dart';
import 'package:whole_snack/features/checkout/view/build_checkout_address.dart';

import 'build_checkout_list.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);

    return Scaffold(
        appBar: SimpleAppBar(
          title: 'Checkout',
          haveBackArrow: true,
          action: () => Get.back(),
        ),
        body: Container(
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: kDefaultMargin.sp,
                      ),
                      Expanded(flex: 1, child: BuildCheckOutAddress()),
                      SizedBox(
                        height: kDefaultMargin.sp,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.white,
                          child: BuildCheckOutList(),
                        ),
                      ),
                      SizedBox(
                        height: kDefaultMargin.sp,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                      child: Container(
                width: double.infinity,
                height: mSizeConfig.blockSizeVertical*25,
                        child: BuildCheckOut(action: ()=> Get.toNamed("/order-success-page"), title: 'Confirm Order',),
              ))),
            ],
          ),
        ));
  }
}
