import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
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



    AlertDialog alert = AlertDialog(
      content: Container(
          width: double.infinity,
          height: 180,
          child: Stack(children: [
            Positioned.fill(
                child: Lottie.asset(
                  "assets/images/order.json",
                )),
            Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text("Order is processing",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20)),
                ))
          ])),
    );


    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: SimpleAppBar(
          title: 'Checkout',
          haveBackArrow: true,
          action: () => Get.back(),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Flexible(
                child: Container(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: kDefaultMargin.sp,
                      ),
                     BuildCheckOutAddress(),
                      SizedBox(
                        height: kDefaultMargin.sp,
                      ),
                      Container(
                            width: double.infinity,
                            height: mSizeConfig.safeBlockVertical * 30,
                            padding: EdgeInsets.only(bottom: 50),
                            child: BuildCheckOutList(),
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
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
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
