// To parse this JSON data, do
//
//     final itemModel = itemModelFromJson(jsonString);

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
    required this.instock,
  });

  String itemId;
  String itemName;
  String packageName;
  String img;
  String itemQty;
  String price;
  String categoryId;
  String categoryName;
  String instock;

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
    itemId: json["item_id"]== null ? "nodata" : json["item_id"],
    itemName: json["item_name"]== null ? "nodata" : json["item_name"],
    packageName: json["package_name"] == null ? "nodata" : json["package_name"],
    img: json["img"]== null ? "nodata" : json["img"],
    itemQty: json["item_qty"]== null ? "nodata" : json["item_qty"],
    price: json["price"]== null ? "nodata" : json["price"],
    categoryId: json["category_id"]== null ? "nodata" : json["category_id"],
    categoryName: json["category_name"]== null ? "nodata" : json["category_name"],
    instock: json["instock"]== null ? "nodata" : json["instock"],
  );

  Map<String, dynamic> toJson() => {
    "item_id": itemId== null ? "nodata" : itemId,
    "item_name": itemName== null ? "nodata" : itemName,
    "package_name": packageName== null ? "nodata" : packageName,
    "img": img== null ? "nodata" : img,
    "item_qty": itemQty== null ? "nodata" : itemQty,
    "price": price== null ? "nodata" : price,
    "category_id": categoryId== null ? "nodata" : categoryId,
    "category_name": categoryName== null ? "nodata" :categoryName,
    "instock": instock== null ? "nodata" : instock,
  };
}
