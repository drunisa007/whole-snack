import 'dart:convert';

import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/order_date_filter_model.dart';
import 'package:whole_snack/core/model/data_model/order_info_model.dart';
import 'package:whole_snack/core/model/data_model/order_item_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';

import 'package:whole_snack/services/http_post_service.dart';

import 'package:whole_snack/core/model/service_model/http_register_result.dart';

import 'package:whole_snack/services/http_service.dart';

class OrderRepo {
  late HttpService _httpService;
  late HttpPostService _httpPostService;
  late HttpCustomResponse result;

  OrderRepo() {
    _httpService = Get.put(HttpService());
    _httpPostService = Get.put(HttpPostService());

    getAllJson();
  }

  Future<HttpGetResult<OrderInfoModel>> getOrderInfo() async {
    if (result.isSuccessful) {
      Map fromJsom = jsonDecode(result.mData);
      String orderData = jsonEncode(fromJsom["orderlist"]["ordersinfo"]);
      List<OrderInfoModel> orderInfoList = orderInfoModelFromJson(orderData);

      return HttpGetResult('', result.stateCode, orderInfoList, true);
    } else {
      return HttpGetResult(
          result.errorMessage, result.stateCode, result.mData, false);
    }
  }

 getAllJson() async {
    result = await _httpService.getData("order/orderfilter.php");
    print(result);
    print(result.mData);
  }


  Future<HttpGetResult<OrderInfoModel>> getFilterOrderInfo(OrderDateFilterModel orderDateFilterModel) async {
    HttpCustomResponse response = await _httpPostService.getOrderByDate(orderDateFilterModel);

    print(response.mData);
    if (response.isSuccessful) {
      Map fromJsom = jsonDecode(response.mData);
      String orderData = jsonEncode(fromJsom["orderlist"]["ordersinfo"]);
      List<OrderInfoModel> orderItemList = orderInfoModelFromJson(orderData);

      print(orderItemList);


      return HttpGetResult('', response.stateCode, orderItemList, true);
    } else {


     ;
      return HttpGetResult(
          result.errorMessage, response.stateCode, result.mData, false);
    }
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

