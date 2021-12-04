import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/build_custom_button.dart';
import 'package:whole_snack/features/order_success/controller/order_success_controller.dart';
import 'package:whole_snack/features/order_success/view/build_order_success_body.dart';

Widget orderSuccessAllWidget(BuildContext context, SizeConfig sizeConfig) {
  return Container(
      width: double.infinity,
      padding: EdgeInsets.all(kDefaultMargin),
      child: BuildOrderSuccessBody());
}



///build button for order track
Column _buildButton(BuildContext context, SizeConfig sizeConfig) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: double.infinity,
        height: sizeConfig.blockSizeHorizontal * 10,
        child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Text(
              "hellow world",
              style: TextStyle(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  fontSize: kExtraLargeFontSize16.sp,
                  fontWeight: FontWeight.w600),
            ),
            color: Theme.of(context).primaryColor,
            onPressed: () => print("hahahah")),
      ),
      SizedBox(
        height: 16,
      ),
      Text("Continue to Shop other Products",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: kLargeFontSize14.sp)),
      SizedBox(
        height: 26,
      )
    ],
  );
}
