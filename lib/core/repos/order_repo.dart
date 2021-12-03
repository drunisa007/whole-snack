import 'dart:convert';

import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/order_info_model.dart';
import 'package:whole_snack/core/model/data_model/order_item_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/services/http_service.dart';

class OrderRepo {
  late HttpService _httpService;
  late HttpCustomResponse result;

  OrderRepo() {
    _httpService = Get.put(HttpService());

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


  getOrderItem() {
    if (result.isSuccessful) {
      Map fromJsom = jsonDecode(result.mData);
      String orderData = jsonEncode(fromJsom["orderlist"]["orderItem"]);
      List<OrderItemModel> orderItemList = orderItemModelFromJson(orderData);

      print("hahhahaha");
      return HttpGetResult('', result.stateCode, orderItemList, true);
    } else {

      print("errooror");
      return HttpGetResult(
          result.errorMessage, result.stateCode, result.mData, false);
    }
  }
/*
  getAllData() async {
    HttpCustomResponse result =
        await _httpService.getData("order/orderfilter.php");

    if (result.isSuccessful) {
      allDataFromJson = jsonDecode(result.mData);

      print(allDataFromJson);
    } else {
      print("error");
    }
  }
*/

}
