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
  DateTime createdAt;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    cusId: json["cus_id"],
    cusName: json["cus_name"],
    cusPhone: json["cus_phone"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "cus_id": cusId,
    "cus_name": cusName,
    "cus_phone": cusPhone,
    "created_at": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
  };
}
