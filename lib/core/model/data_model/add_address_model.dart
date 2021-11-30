import 'dart:convert';

List<AddAddressModel> addAddressModelFromJson(String str) => List<AddAddressModel>.from(json.decode(str).map((x) => AddAddressModel.fromJson(x)));

String addAddressModelToJson(List<AddAddressModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddAddressModel {
  AddAddressModel({
  required  this.cusAddress,
  required  this.regName,
  required  this.regId,
   required this.cusId,
  });

  String cusAddress;
  String regName;
  String regId;
  String cusId;

  factory AddAddressModel.fromJson(Map<String, dynamic> json) => AddAddressModel(
    cusAddress: json["cus_address"],
    regName: json["reg_name"],
    regId: json["reg_id"],
    cusId: json["cus_id"],
  );

  Map<String, dynamic> toJson() => {
    "cus_address": cusAddress,
    "reg_name": regName,
    "reg_id": regId,
    "cus_id": cusId,
  };
}
