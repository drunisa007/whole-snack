// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    required this.message,
    required this.customer,
  });

  String message;
  Customer customer;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    message: json["message"],
    customer: Customer.fromJson(json["customer"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "customer": customer.toJson(),
  };
}

class Customer {
  Customer({
    required this.token,
    required this.cusId,
  });

  String token;
  String cusId;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    token: json["token"] == null ? "null" : json["token"],
    cusId: json["cus_id"] == null ? "null" :json["cus_id"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "cus_id": cusId,
  };
}
