import 'dart:convert';

List<RegionModel> regionModelFromJson(String str) => List<RegionModel>.from(json.decode(str).map((x) => RegionModel.fromJson(x)));

String regionModelToJson(List<RegionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RegionModel {
  RegionModel({
   required this.regId,
   required this.regName,
  });

  String regId;
  String regName;

  factory RegionModel.fromJson(Map<String, dynamic> json) => RegionModel(
    regId: json["reg_id"],
    regName: json["reg_name"],
  );

  Map<String, dynamic> toJson() => {
    "reg_id": regId,
    "reg_name": regName,
  };
}
