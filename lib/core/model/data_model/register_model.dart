// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    required this.customer,
    required this.token,
  });

  Customer customer;
  String token;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    customer:  Customer.fromJson(json["customer"]),
    token: json["token"] == null ? "null" : json["token"],
  );

  Map<String, dynamic> toJson() => {
    "customer": customer == null ? null : customer.toJson(),
    "token": token == null ? null : token,
  };
}

class Customer {
  Customer({
    required this.cusId,
    required this.cusName,
    required this.cusPhone,
  });

  String cusId;
  String cusName;
  String cusPhone;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    cusId: json["cus_id"] == null ? "null" : json["cus_id"],
    cusName: json["cus_name"] == null ? "null" : json["cus_name"],
    cusPhone: json["cus_phone"] == null ? "null" : json["cus_phone"],
  );

  Map<String, dynamic> toJson() => {
    "cus_id": cusId == null ? "null" : cusId,
    "cus_name": cusName == null ? "null" : cusName,
    "cus_phone": cusPhone == null ? "null" : cusPhone,
  };
}
