import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/cart/controller/cart_controller.dart';

class BuildCustomCheckoutButton extends StatelessWidget {
  final String title;
  final action;
  const BuildCustomCheckoutButton(
      {Key? key, required this.action, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);

    CartController mCartController = Get.find<CartController>();

    return Obx((){
      return Material(
        borderRadius: BorderRadius.circular(6.sp),
        color: mCartController.token.value.isEmpty? Theme.of(context).primaryColor:mCartController.mAddToCartList.length > 0
            ? Theme.of(context).primaryColor
            : Colors.grey,
        shadowColor: Colors.grey,
        child: InkWell(
          borderRadius: BorderRadius.circular(6.sp),
          splashColor: Colors.white.withOpacity(0.1),
          onTap: action,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: kDefaultMargin, right: kDefaultMargin),
            height: mSizeConfig.blockSizeVertical * 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.sp),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: kLargeFontSize13),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Grand Total",
                      style: TextStyle(
                          color: Colors.white, fontSize: kExtraSmallFontSize8),
                    ),
                    Obx(() {
                      return Text(
                        "Ks. ${mCartController.grandTotal.value}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: kLargeFontSize13),
                      );
                    }),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
