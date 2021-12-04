import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/cart/controller/cart_controller.dart';
import 'package:whole_snack/features/cart/view/build_linear_progress_bar.dart';

class BuildDeliveryFee extends StatelessWidget {
  const BuildDeliveryFee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);


    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: kDefaultMargin.sp,
        right: kDefaultMargin.sp,
        bottom: kDefaultMargin.sp,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Delivery Fee",
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondaryVariant,
                fontSize: kLargeFontSize13),
          ),
          SizedBox(
            height: 2.sp,
          ),
          BuildLinearProgressBar(
          )
        ],
      ),
    );
  }
}
