// To parse this JSON data, do
//
//     final orderSubmitModel = orderSubmitModelFromJson(jsonString);

import 'dart:convert';

OrderSubmitModel orderSubmitModelFromJson(String str) => OrderSubmitModel.fromJson(json.decode(str));

String orderSubmitModelToJson(OrderSubmitModel data) => json.encode(data.toJson());

class OrderSubmitModel {
  OrderSubmitModel({
    required this.cusId,
    required this.ordPrice,
    required this.ordPhone,
    required this.address,
    required this.regId,
    required this.deliveryFee,
    required this.cart,
  });

  String cusId;
  String ordPrice;
  String ordPhone;
  String address;
  String regId;
  String deliveryFee;
  List<Cart> cart;

  factory OrderSubmitModel.fromJson(Map<String, dynamic> json) => OrderSubmitModel(
    cusId: json["cus_id"],
    ordPrice: json["ord_price"],
    ordPhone: json["ord_phone"],
    address: json["address"],
    regId: json["reg_id"],
    deliveryFee: json["delivery_fee"],
    cart: List<Cart>.from(json["cart"].map((x) => Cart.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cus_id": cusId,
    "ord_price": ordPrice,
    "ord_phone": ordPhone,
    "address": address,
    "reg_id": regId,
    "delivery_fee": deliveryFee,
    "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
  };
}

class Cart {
  Cart({
    required this.packageid,
    required this.qty,
  });

  String packageid;
  String qty;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    packageid: json["packageid"],
    qty: json["qty"],
  );

  Map<String, dynamic> toJson() => {
    "packageid": packageid,
    "qty": qty,
  };
}
