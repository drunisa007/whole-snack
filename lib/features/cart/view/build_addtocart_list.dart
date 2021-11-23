import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/temp_model/temp_addtocart_model.dart';
import 'package:whole_snack/features/cart/controller/cart_controller.dart';
import 'package:whole_snack/features/cart/view/build_addtocart_list_single.dart';

class BuildAddToCartList extends StatelessWidget {
  const BuildAddToCartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController mCartController = Get.find<CartController>();


    return Obx(() {
      return ListView.separated(
        itemBuilder: (context, index) {
          return BuildAddToCartListSingle(index:index);
        },
        shrinkWrap: true,
        itemCount: mCartController.mAddToCartList.length,
        separatorBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(
                left: kDefaultMargin.sp + kDefaultMargin.sp,
                right: kDefaultMargin.sp + kDefaultMargin.sp),
            child: Divider(
              height: 0.8,
              color: Colors.grey.withOpacity(0.7),
            ),
          );
        },
      );
    });
  }
}
