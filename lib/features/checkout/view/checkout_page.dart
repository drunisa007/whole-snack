import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/appbar/simple_app_bar.dart';
import 'package:whole_snack/features/add_address/controller/add_address_page_controller.dart';
import 'package:whole_snack/features/cart/controller/cart_controller.dart';
import 'package:whole_snack/features/cart/view/build_checkout.dart';
import 'package:whole_snack/features/checkout/controller/checkout_controller.dart';
import 'package:whole_snack/features/checkout/view/build_checkout_address.dart';
import 'package:whole_snack/features/feature_main/controller/feature_main_controller.dart';
import 'package:whole_snack/features/manage_address/controller/manage_address_controller.dart';

import 'build_checkout_list.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);

    CheckOutController mCheckoutController = Get.find<CheckOutController>();




    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: SimpleAppBar(
          title: 'Checkout',
          haveBackArrow: true,
          action: () => Get.back(),
        ),
        body: Container(
          child: Column(
            children: [
              Flexible(
                child: Container(
                  child: ListView(
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
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: double.infinity,
                            height: mSizeConfig.safeBlockVertical * 30,
                            padding: EdgeInsets.only(bottom: 50),
                            child: BuildCheckOutList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: kDefaultMargin.sp,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: mSizeConfig.blockSizeVertical * 22,
                child: SingleChildScrollView(
                  child: BuildCheckOut(
                    action: () {
                        mCheckoutController.submitOrder(context);
                    },
                    title: 'Confirm Order',
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
