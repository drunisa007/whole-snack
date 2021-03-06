import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/data_model/address_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/core/repos/get_address_repo.dart';
import 'package:whole_snack/core/repos/helper/secure_storage_helper.dart';
import 'package:whole_snack/features/cart/controller/cart_controller.dart';

class ManageAddressController extends GetxController {


 late GetAddressRepo getAddressRepo;

  RxList<AddressModel> addressList = RxList();


  CartController mCartController= Get.find<CartController>();

  ManageAddressController() {
    getAddressRepo = Get.put(GetAddressRepo());
  }


  RxBool loading = RxBool(true);
  RxString errorMessage = RxString("");

  getMyAddress() async{
    if(mCartController.token.isNotEmpty){
      loading.value = true;
      HttpGetResult<AddressModel> result = await getAddressRepo.getAddress(customerId: mCartController.customId.value.toString());
     loading.value =false;

     if(result.isSuccessful){
       addressList.clear();
       addressList.addAll(result.mData);
       errorMessage.value = "";
     }
     else{
       errorMessage.value= result.errorMessage;
     }
    }
    else{
      loading.value =false;
      errorMessage.value = "no token";
    }

    //print(addressList);
  }

  deleteAddress(String id) async {

    HttpCustomResponse response = await getAddressRepo.deleteAddress(id);
    addressList.clear();

    getMyAddress();

  }


}