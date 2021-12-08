import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/data_model/register_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/core/model/service_model/http_register_result.dart';
import 'package:whole_snack/core/repos/LoginRegisterRepo.dart';
import 'package:whole_snack/core/repos/helper/secure_storage_helper.dart';
import 'package:whole_snack/core/widgets/loading_dialog.dart';
import 'package:whole_snack/features/cart/controller/cart_controller.dart';
import 'package:whole_snack/features/order/controller/order_controller.dart';

class OtpPageController extends GetxController {
  late LoginRegisterRepo loginRegisterRepo;

  late SecureStorageHelper helper;
  RxBool isLoading = true.obs;
  RxString errorMessage = RxString("");

  RxString token = RxString("");

  CartController mCartController = Get.find<CartController>();
  OrderController mOrderController = Get.find<OrderController>();

  OtpPageController() {

    for(int i=0;i<4;i++){
      mOptCodeList.add(" ");
    }

    loginRegisterRepo = Get.put(LoginRegisterRepo());
    helper = Get.put(SecureStorageHelper());
  }

  getOpt(
      {required String name,
      required String phone,
      required String otp,
      required context,
      }) async {
    isLoading.value = true;

    showLoaderDialog(context);
    HttpRegisterResult<RegisterModel> customResponse =
        await loginRegisterRepo.otpConfirm(name: name, phone: phone, otp: otp);

    if(customResponse.isSuccessful){

       await helper.writeSecureData(
          key: TOKEN_KEY, value: customResponse.mData.token);
       await helper.writeSecureData(
          key: CUSTOMER_ID_KEY, value: customResponse.mData.customer.cusId);
       mCartController.checkLoginOrNot();
       mOrderController.FetchOrderController();
      Get.back();
      Get.back();
      Get.back();
    }
    else{
      Get.snackbar("Something went wrong", "Invalid Otp Code");
    }


    // isLoading.value = false;
    // if (customResponse.mData.customer.cusId.isNotEmpty &&
    //     customResponse.mData.token.isNotEmpty) {
    //   errorMessage.value = "";
    //
    //   await helper.writeSecureData(
    //       key: TOKEN_KEY, value: customResponse.mData.token);
    //   await helper.writeSecureData(
    //       key: CUSTOMER_ID_KEY, value: customResponse.mData.customer.cusId);
    //
    //   var loginToken = await helper.writeSecureData(
    //       key: TOKEN_KEY, value: customResponse.mData.token);
    //
    //   token.value = loginToken.toString();
    //
    //   if (token.value.isNotEmpty) {
    //     Get.back();
    //     Get.back();
    //     Get.back();
    //   } else {
    //     print("$token is token");
    //   }
    // } else {
    //   errorMessage.value = "Something Wrong";
    // }
  }


  /// arun custom text controller

  RxList<String> mOptCodeList = RxList();

  RxInt codePosition = RxInt(0);

  TextEditingController mAllCodeController = TextEditingController();



  addSingleNewCode(BuildContext context, FocusNode inputNode){
    if(mAllCodeController.text.toString().isNotEmpty){
      int tempPosition = mAllCodeController.text.toString().length-1;
      mOptCodeList[tempPosition]=mAllCodeController.text.toString()[tempPosition];
      print(mOptCodeList);
      if(tempPosition==3){
        codePosition.value = tempPosition;
        print('tempPosition is 4 now');
        inputNode.unfocus();
        //FocusScope.of(context).unfocus();
      }

    }

  }

  createOptCode(){
    String otpCode = "";
    for(int i=0;i<mOptCodeList.length;i++){
      otpCode = otpCode+mOptCodeList[i];
    }

    mAllCodeController.clear();

    return otpCode;
  }

}
