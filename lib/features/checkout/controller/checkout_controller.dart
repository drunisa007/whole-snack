import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/ordersubmit_model.dart';
import 'package:whole_snack/core/model/data_model/region_model.dart';
import 'package:whole_snack/core/model/service_model/http_register_result.dart';
import 'package:whole_snack/core/model/temp_model/temp_addtocart_model.dart';
import 'package:whole_snack/core/repos/order_repo.dart';
import 'package:whole_snack/features/add_address/controller/add_address_page_controller.dart';
import 'package:whole_snack/features/cart/controller/cart_controller.dart';
import 'package:whole_snack/features/feature_main/controller/feature_main_controller.dart';

class CheckOutController extends GetxController{


  /// for submit order

  OrderRepo mOrderRepo = Get.find<OrderRepo>();

    CartController mCartController = Get.find<CartController>();
    AddAddressPageController mAddressController = Get.find<AddAddressPageController>();



    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();

    RxString regionId = RxString("");
    RxString address = RxString("");
    RxString orderPhone =RxString("");

      submitOrder(context) async {

        orderPhone.value  = phoneController.text.toString();
        address.value = addressController.text.toString();
        regionId.value = mAddressController.regionId;


      if (mCartController.mAddToCartList.length > 0) {

        if(orderPhone.value.isNotEmpty){
          if(address.value.isNotEmpty){
            if(regionId.value.isNotEmpty){

              List<Cart> mListCart = [];

              for (TempAddToCartModel cart in mCartController.mAddToCartList) {
                mListCart.add(Cart(packageid: cart.itemPackage.packageId,
                    qty: cart.count.toString()));
              }

              var body = {
                "cus_id": "129",
                "ord_price": mCartController.totalPrice.value.toString(),
                "ord_phone": orderPhone.value,
                "address":  address.value,
                "reg_id": regionId.value,
                "delivery_fee": mCartController.deliveryFee.value.toString(),
                "cart": mListCart
              };

              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Please wait . . .'),
                    content: Text('Processing your order.'),
                  )
              );

              HttpRegisterResult mResult = await mOrderRepo.submitOrder(body);
              if (mResult.isSuccessful) {
                 mCartController.clearCartController();
                 phoneController.text = "";
                  addressController.text="";
                 mAddressController.regionId = "";
                 FeatureMainController mFeatureMainController = Get.find<FeatureMainController>();
                 mFeatureMainController.pushNewRoutesHistory();
                 Get.offAndToNamed("/order-success-page");
              }
              else {
                showSnackBarOrder("Order Submit Fail", "please check your internet connection or refresh again");
              }

            }
            else{
              showSnackBarOrder('Empty', "Please choose region");
            }
          }
          else{
            showSnackBarOrder('Empty', "Please enter your address");
          }
        }
        else{
          showSnackBarOrder('Empty', "Please enter your phone number");
        }
      }
      else{
         showSnackBarOrder("items are empty", "please choose your items");
      }
    }


    showSnackBarOrder(title,message){
      Get.snackbar(title, message);
    }


}