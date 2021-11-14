import 'dart:convert';

List<ItemModel> itemModelFromJson(String str) => List<ItemModel>.from(json.decode(str).map((x) => ItemModel.fromJson(x)));

String itemModelToJson(List<ItemModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemModel {
  ItemModel({
    required this.itemId,
    required this.itemName,
    required this.packageName,
    required this.img,
    required this.itemQty,
    required this.price,
    required this.categoryId,
    required this.categoryName,
  });

  String itemId;
  String itemName;
  String packageName;
  String img;
  String itemQty;
  String price;
  String categoryId;
  String categoryName;

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
    itemId: json["item_id"],
    itemName: json["item_name"],
    packageName: json["package_name"],
    img: json["img"],
    itemQty: json["item_qty"],
    price: json["price"],
    categoryId: json["category_id"],
    categoryName: json["category_name"],
  );

  Map<String, dynamic> toJson() => {
    "item_id": itemId,
    "item_name": itemName,
    "package_name": packageName,
    "img": img,
    "item_qty": itemQty,
    "price": price,
    "category_id": categoryId,
    "category_name": categoryName,
  };
}
