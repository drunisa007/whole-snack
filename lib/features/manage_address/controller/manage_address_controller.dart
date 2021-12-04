import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/address_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/core/repos/get_address_repo.dart';

class ManageAddressController extends GetxController {


 late GetAddressRepo getAddressRepo;
 String customerId = "56";
  RxList<AddressModel> addressList = RxList();



  ManageAddressController() {
    getAddressRepo = Get.put(GetAddressRepo());
    getMyAddress();

  }


  getMyAddress() async{

    HttpGetResult<AddressModel> result = await getAddressRepo.getAddress(customerId: customerId);


    addressList.clear();

    addressList.addAll(result.mData);


    print(addressList);


  }

  deleteAddress(AddressModel model) async {

    HttpCustomResponse response = await getAddressRepo.deleteAddress(model);
  }


}