import 'dart:convert';

AddAddressModel addAddressModelFromJson(String str) => AddAddressModel.fromJson(json.decode(str));

String addAddressModelToJson(AddAddressModel data) => json.encode(data.toJson());

class AddAddressModel {
  AddAddressModel({
    required this.cusId,
    required this.regId,
    required this.cusAddress,
  });

  String cusId;
  String regId;
  String cusAddress;

  factory AddAddressModel.fromJson(Map<String, dynamic> json) => AddAddressModel(
    cusId: json["cus_id"],
    regId: json["reg_id"],
    cusAddress: json["cus_address"],
  );

  Map<String, dynamic> toJson() => {
    "cus_id": cusId,
    "reg_id": regId,
    "cus_address": cusAddress,
  };
}
