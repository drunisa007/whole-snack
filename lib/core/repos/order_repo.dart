

import 'dart:convert';

import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/order_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/core/model/service_model/http_register_result.dart';
import 'package:whole_snack/services/http_service.dart';

class OrderRepo {

  late HttpService _httpService;

  OrderRepo() {

    _httpService = Get.put(HttpService());
  }

 Future<HttpGetResult<OrderModel>> getAllOrder() async {


    HttpCustomResponse result =  await _httpService.getData("order/orderfilter.php");

    if(result.isSuccessful) {


      Map fromJsom = jsonDecode(result.mData);
      String orderData = jsonEncode(fromJsom["orderlist"]["ordersinfo"]);
      List<OrderModel> townshipList = orderModelFromJson(orderData);

      return HttpGetResult('', result.stateCode, townshipList, true);
    } else {


      return HttpGetResult(result.errorMessage, result.stateCode, result.mData, false);
    }




  }


  Future<HttpRegisterResult<String>> submitOrder(body) async {


    HttpCustomResponse result =  await _httpService.orderSubmit("order/submitorder.php",body);


    if(result.isSuccessful) {
      return HttpRegisterResult('', result.stateCode, "success", true);
    }
    else {


      return HttpRegisterResult(result.errorMessage, result.stateCode,"not success", false);
    }




  }

}