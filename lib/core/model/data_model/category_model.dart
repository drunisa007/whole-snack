import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  CategoryModel({
    required this.categId,
    required this.categName,
    required this.categImg,
  });

  String categId;
  String categName;
  String categImg;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    categId: json["categ_id"],
    categName: json["categ_name"],
    categImg: json["categ_img"],
  );

  Map<String, dynamic> toJson() => {
    "categ_id": categId,
    "categ_name": categName,
    "categ_img": categImg,
  };
}
