import 'dart:convert';

List<TypeModel> typeModelFromJson(String str) => List<TypeModel>.from(json.decode(str).map((x) => TypeModel.fromJson(x)));

String typeModelToJson(List<TypeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TypeModel {
  TypeModel({
    required this.typeId,
    required this.typeName,
    required this.typeImg,
    required this.categId,
  });

  String typeId;
  String typeName;
  String typeImg;
  String categId;

  factory TypeModel.fromJson(Map<String, dynamic> json) => TypeModel(
    typeId: json["type_id"],
    typeName: json["type_name"],
    typeImg: json["type_img"],
    categId: json["categ_id"],
  );

  Map<String, dynamic> toJson() => {
    "type_id": typeId,
    "type_name": typeName,
    "type_img": typeImg,
    "categ_id": categId,
  };
}