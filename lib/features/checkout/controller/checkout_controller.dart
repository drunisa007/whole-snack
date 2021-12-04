import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/ordersubmit_model.dart';
import 'package:whole_snack/core/model/data_model/region_model.dart';
import 'package:whole_snack/core/model/service_model/http_register_result.dart';
import 'package:whole_snack/core/model/temp_model/temp_addtocart_model.dart';
import 'package:whole_snack/core/repos/order_repo.dart';
import 'package:whole_snack/features/cart/controller/cart_controller.dart';

class CheckOutController extends GetxController{
  List<RegionModel> townshipList = [];
  RegionModel ? choosenValue;


  /// for submit order

  OrderRepo mOrderRepo = Get.find<OrderRepo>();

  CartController mCartController = Get.find<CartController>();

  CheckOutController() {
    addTownshipAddress();
  }




    RxString regionId = RxString("3");
    RxString address = RxString("Chanmyatharsi");
    RxString orderPhone =RxString("09785882381");

      submitOrder(context) async {
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
                "cus_id": "55",
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
                 Get.back();
                 Get.back();
                 Get.back();
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

    /// to clear after submitting order

  addTownshipAddress() {
    townshipList = <RegionModel>[
/*      RegionModel(id: 1, townshipName: "Amarapura"),
      RegionModel(id: 2, townshipName: "Aungmyaythazan"),
      RegionModel(id: 3, townshipName: "Amarapura"),
      RegionModel(id: 4, townshipName: "Chanayethazan"),
      RegionModel(id: 5, townshipName: "Chanmyathazi"),
      RegionModel(id: 6, townshipName: "Mahaaungmyay"),
      RegionModel(id: 7, townshipName: "Patheingyi"),
      RegionModel(id: 8, townshipName: "Pyigyidagun"),*/
    ];
  }


  changeDropDownValue(RegionModel model) {

    int index = townshipList.indexOf(model);
    choosenValue = townshipList[index];

    update();
  }
}