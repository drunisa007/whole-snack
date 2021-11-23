import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/widgets/build_custom_checkout_button.dart';
import 'package:whole_snack/features/cart/controller/cart_controller.dart';

class BuildCheckOut extends StatelessWidget {
  const BuildCheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    CartController mCartController = Get.find<CartController>();

    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.sp),
              topRight: Radius.circular(10.sp))),
      margin: EdgeInsets.zero,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(kDefaultMargin.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.sp),
              topRight: Radius.circular(20.sp)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Item Total",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: kLargeFontSize14,
                      fontWeight: FontWeight.w700),
                ),
                Spacer(),
               Obx((){
                 return Text(
                     "Ks. ${mCartController.totalPrice.value.round()}",
                     style: TextStyle(
                     color: Theme.of(context).colorScheme.onPrimary,
                 fontSize: kLargeFontSize14,
                 fontWeight: FontWeight.w700),
                 );
               })
              ],
            ),
            SizedBox(
              height: kDefaultMargin.sp,
            ),
            Row(
              children: [
                Text(
                  "Delivery Fees",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: kLargeFontSize14,
                      fontWeight: FontWeight.w700),
                ),
                Spacer(),
              Obx((){
                return mCartController.deliveryFee.value==-1?
                Text(
                  "Free",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: kLargeFontSize14,
                      fontWeight: FontWeight.w700),
                ):Text(
                  "Ks. ${mCartController.deliveryFee.value}",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: kLargeFontSize14,
                      fontWeight: FontWeight.w700),
                );
              })
              ],
            ),
            SizedBox(
              height: kDefaultMargin.sp,
            ),
            Divider(
              thickness: 0.8,
            ),
            SizedBox(
              height: kDefaultMargin.sp,
            ),
            BuildCustomCheckoutButton(
                action: () => print("hell"),
                title: "Continue To Check Out",
                )
          ],
        ),
      ),
    );
  }
}
