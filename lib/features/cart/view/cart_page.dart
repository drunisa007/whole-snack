import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/appbar/simple_app_bar.dart';
import 'package:whole_snack/core/widgets/appbar/simple_custom_appbar.dart';
import 'package:whole_snack/features/cart/controller/cart_controller.dart';
import 'package:whole_snack/features/cart/view/build_addtocart_list.dart';
import 'package:whole_snack/features/cart/view/build_checkout.dart';
import 'package:whole_snack/features/cart/view/build_delivery_fee.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);

    CartController mCartController = Get.find<CartController>();

    return Scaffold(
    appBar: SimpleCustomAppBar(
    title: 'Shopping Cart'
    ),
      body: Column(
        children: [
          SizedBox(
            height: kDefaultMargin,
          ),
          Container(
            width: double.infinity,
            height: mSizeConfig.blockSizeVertical * 50,
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                    flex: 8,
                    child: Container(
                      width: double.infinity,
                      child: BuildAddToCartList(),
                    )),
                Expanded(
                    flex: 3,
                    child: BuildDeliveryFee())
              ],
            ),
          ),
          Spacer(),
         BuildCheckOut(action: (){


           if(mCartController.mAddToCartList.length>0){


             mCartController.checkoutCheckStatus();

           }
           else{
             Get.snackbar("Empty","Choose your favourite items to checkout.");
           }
         }, title: 'Continue to checkout',)
        ],
      ),
    );
  }
}
