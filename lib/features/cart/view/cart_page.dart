import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/appbar/simple_app_bar.dart';
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
      appBar: SimpleAppBar(
        title: 'Shopping Cart',
        haveBackArrow: mCartController.cartAppBarBackArrow.value,
        action: (){
          mCartController.cartAppBarBackArrow.value = false;
          mCartController.cartAppBarBackArrow.refresh();
          Get.back();
        },
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
                    flex: 7,
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
         BuildCheckOut(action: ()=> Get.toNamed("checkout-page",), title: 'Continue to checkout',)
        ],
      ),
    );
  }
}
