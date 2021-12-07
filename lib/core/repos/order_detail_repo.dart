import 'dart:convert';

import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/data_model/order_detail_model.dart';
import 'package:whole_snack/core/model/data_model/order_info_model.dart';
import 'package:whole_snack/core/model/data_model/order_item_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/services/http_service.dart';

class OrderDetailRepo {
  late HttpService _httpService;

  OrderDetailRepo() {
    _httpService = Get.put(HttpService());
  }

  Future<HttpGetResult<OrderDetailModel>> getOrderDetailById(int id) async {
    HttpCustomResponse response = await _httpService
        .getDataWithHeader("order/getorder.php?order_id=${100}");


    if (response.isSuccessful) {
      Map fromJsom = jsonDecode(response.mData);
      String orderDetail = jsonEncode(fromJsom["detail"]);
      // String orderInfo = jsonEncode(fromJsom["orderlist"]["ordersinfo"]);
      // String orderItem = jsonEncode(fromJsom["orderlist"]["orderItem"]);
      // List<OrderInfoModel> orderInfoList = orderInfoModelFromJson(orderInfo);
      // List<OrderItemModel> orderItemList = orderItemModelFromJson(orderItem);

      OrderDetailModel orderDetailModel = orderDetailModelFromJson(orderDetail);





      return HttpGetResult("", response.stateCode, [orderDetailModel], true);
    } else {

      print(response.stateCode);
      return HttpGetResult("", response.stateCode, response.mData, true);
    }
  }
}
