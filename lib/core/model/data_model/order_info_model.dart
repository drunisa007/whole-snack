// To parse this JSON data, do
//
//     final orderInfoModel = orderInfoModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<OrderInfoModel> orderInfoModelFromJson(String str) => List<OrderInfoModel>.from(json.decode(str).map((x) => OrderInfoModel.fromJson(x)));

String orderInfoModelToJson(List<OrderInfoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderInfoModel {
  OrderInfoModel({
    required this.ordId,
    required this.ordNo,
    required this.ordCreate,
    required this.ordShip,
    required this.ordAccept,
    required this.ordDelivered,
    required this.ordPrice,
    required this.ordPhone,
    required this.ordAddress,
    required this.ordStatus,
    required this.deliveryFee,
    required this.riderPhone,
    required this.ordType,
    required this.cusId,
    required this.regId,
    required this.riderId,
  });

  String ordId;
  String ordNo;
  String ordCreate;
  String ordShip;
  String ordAccept;
  String ordDelivered;
  String ordPrice;
  String ordPhone;
  String ordAddress;
  String ordStatus;
  String deliveryFee;
  String riderPhone;
  String ordType;
  String cusId;
  String regId;
  String riderId;

  factory OrderInfoModel.fromJson(Map<String, dynamic> json) => OrderInfoModel(
    ordId: json["ord_id"] == null ? "nodata" : json["ord_id"],
    ordNo: json["ord_no"] == null ? "nodata" : json["ord_no"],
    ordCreate: json["ord_create"] == null ? "nodata" : json["ord_create"],
    ordShip: json["ord_ship"] == null ? "nodata" : json["ord_ship"],
    ordAccept: json["ord_accept"] == null ? "nodata" : json["ord_accept"],
    ordDelivered: json["ord_delivered"] == null ? "nodata" : json["ord_delivered"],
    ordPrice: json["ord_price"] == null ? "nodata" : json["ord_price"],
    ordPhone: json["ord_phone"] == null ? "nodata" : json["ord_phone"],
    ordAddress: json["ord_address"] == null ? "nodata" : json["ord_address"],
    ordStatus: json["ord_status"] == null ? "nodata" : json["ord_status"],
    deliveryFee: json["delivery_fee"] == null ? "nodata" : json["delivery_fee"],
    riderPhone: json["rider_phone"]== null ? "nodata" :json["rider_phone"] ,
    ordType: json["ord_type"] == null ? "nodata" : json["ord_type"],
    cusId: json["cus_id"] == null ? "nodata" : json["cus_id"],
    regId: json["reg_id"] == null ? "nodata" : json["reg_id"],
    riderId: json["rider_id"] == null ? "nodata" : json["rider_id"],
  );

  Map<String, dynamic> toJson() => {
    "ord_id": ordId == null ? "nodata" : ordId,
    "ord_no": ordNo == null ? "nodata" : ordNo,
    "ord_create": ordCreate == null ? "nodata" : ordCreate,
    "ord_ship": ordShip == null ? "nodata" : ordShip,
    "ord_accept": ordAccept == null ? "nodata" : ordAccept,
    "ord_delivered": ordDelivered == null ? "nodata" : ordDelivered,
    "ord_price": ordPrice == null ? "nodata" : ordPrice,
    "ord_phone": ordPhone == null ? "nodata" : ordPhone,
    "ord_address": ordAddress == null ? "nodata" : ordAddress,
    "ord_status": ordStatus == null ? "nodata" : ordStatus,
    "delivery_fee": deliveryFee == null ? "nodata": deliveryFee,
    "rider_phone": riderPhone == null ? "nodata" : riderPhone,
    "ord_type": ordType == null ? "nodata" : ordType,
    "cus_id": cusId == null ? "nodata" : cusId,
    "reg_id": regId == null ? "nodata" : regId,
    "rider_id": riderId == null ? "nodata" : riderId,
  };
}
