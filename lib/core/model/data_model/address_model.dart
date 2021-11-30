import 'dart:convert';

List<AddressModel> addressModelFromJson(String str) => List<AddressModel>.from(json.decode(str).map((x) => AddressModel.fromJson(x)));

String addressModelToJson(List<AddressModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class AddressModel {
  AddressModel({
   required this.cusAddress,
    required this.regName,
    required  this.regId,
    required  this.cusId,
  });

  String cusAddress;
  String regName;
  String regId;
  String cusId;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
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
