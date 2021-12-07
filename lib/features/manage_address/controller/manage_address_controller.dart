import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/data_model/address_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/core/repos/get_address_repo.dart';
import 'package:whole_snack/core/repos/helper/secure_storage_helper.dart';

class ManageAddressController extends GetxController {


 late GetAddressRepo getAddressRepo;

  RxList<AddressModel> addressList = RxList();

  late dynamic customerId;
  late SecureStorageHelper helper;



  ManageAddressController() {
    getAddressRepo = Get.put(GetAddressRepo());
    initState();
    getMyAddress();

  }

  initState() async {

    helper = Get.put(SecureStorageHelper());
    customerId = await helper.readSecureData(key: CUSTOMER_ID_KEY);

  }

  getMyAddress() async{

    HttpGetResult<AddressModel> result = await getAddressRepo.getAddress(customerId: customerId.toString());

    addressList.clear();

    addressList.addAll(result.mData);


    //print(addressList);


  }

  deleteAddress(String id) async {


    HttpCustomResponse response = await getAddressRepo.deleteAddress(id);
    addressList.clear();

    getMyAddress();

  }


}