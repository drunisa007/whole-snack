import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/widgets/build_custom_checkout_button.dart';
import 'package:whole_snack/features/cart/controller/cart_controller.dart';

class BuildCheckOut extends StatelessWidget {

  final String title;
  final action;
  final disable;

  const BuildCheckOut({Key? key, required this.title, this.action,this.disable}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    CartController mCartController = Get.find<CartController>();

    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.sp),
              topRight: Radius.circular(15.sp))),
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
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      fontSize: kLargeFontSize13,
                      ),
                ),
                Spacer(),
               Obx((){
                 return Text(
                     "Ks. ${mCartController.totalPrice.value.round()}",
                     style: TextStyle(
                         color: Theme.of(context).colorScheme.secondaryVariant,
                         fontSize: kLargeFontSize13),
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
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      fontSize: kLargeFontSize13),
                ),
                Spacer(),
              Obx((){
                return mCartController.deliveryFee.value==-1?
                Text(
                  "Free",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      fontSize: kLargeFontSize13),
                ):Text(
                  "Ks. ${mCartController.deliveryFee.value}",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      fontSize: kLargeFontSize13),
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
                action:action,
                title: "$title",
                )
          ],
        ),
      ),
    );
  }
}
