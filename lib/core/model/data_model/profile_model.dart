import 'dart:convert';

List<ProfileModel> profileModelFromJson(String str) => List<ProfileModel>.from(json.decode(str).map((x) => ProfileModel.fromJson(x)));

String profileModelToJson(List<ProfileModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProfileModel {
  ProfileModel({
    required this.cusId,
    required this.cusName,
    required this.cusPhone,
    required this.createdAt,
  });

  String cusId;
  String cusName;
  String cusPhone;
  String createdAt;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    cusId: json["cus_id"] == null ? "No Data" : json["cus_id"],
    cusName: json["cus_name"] == null ? "Minglabar" : json["cus_name"],
    cusPhone: json["cus_phone"] == null ? "Nod Data" : json["cus_phone"],
    createdAt: json["created_at"] == null ? "No Data" : json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "cus_id": cusId == null ? "No Data" : cusId,
    "cus_name": cusName == null ? "No Data" : cusName,
    "cus_phone": cusPhone == null ? "No Data" : cusPhone,
    "created_at": createdAt == null ? "No Data" : createdAt,
  };
}
