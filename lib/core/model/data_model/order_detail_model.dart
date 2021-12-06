// To parse this JSON data, do
//
//     final orderDetailModel = orderDetailModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:whole_snack/core/model/data_model/order_info_model.dart';
import 'package:whole_snack/core/model/data_model/order_item_model.dart';

OrderDetailModel orderDetailModelFromJson(String str) =>
    OrderDetailModel.fromJson(json.decode(str));

String orderDetailModelToJson(OrderDetailModel data) =>
    json.encode(data.toJson());

class OrderDetailModel {
  OrderDetailModel({
    required this.ordersinfo,
    required this.orderItem,
  });

  List<OrderInfoModel> ordersinfo;
  List<OrderItemModel> orderItem;

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailModel(
        ordersinfo: List<OrderInfoModel>.from(
            json["ordersinfo"].map((x) => OrderInfoModel.fromJson(x))),
        orderItem: List<OrderItemModel>.from(
            json["orderItem"].map((x) => OrderItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ordersinfo": ordersinfo == null
            ? "null"
            : List<dynamic>.from(ordersinfo.map((x) => x.toJson())),
        "orderItem": orderItem == null
            ? "null"
            : List<dynamic>.from(orderItem.map((x) => x.toJson())),
      };
}
