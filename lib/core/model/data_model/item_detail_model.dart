// To parse this JSON data, do
//
//     final itemDetailModel = itemDetailModelFromJson(jsonString);

import 'dart:convert';

List<ItemDetailModel> itemDetailModelFromJson(String str) => List<ItemDetailModel>.from(json.decode(str).map((x) => ItemDetailModel.fromJson(x)));

String itemDetailModelToJson(List<ItemDetailModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemDetailModel {
  ItemDetailModel({
    required this.itemId,
    required this.itemName,
    required this.packageId,
    required this.packageName,
    required this.itemQty,
    required this.price,
    required this.instock,
    required this.itemImg,
  });

  String itemId;
  String itemName;
  String packageId;
  String packageName;
  String itemQty;
  String price;
  String instock;
  String itemImg;

  factory ItemDetailModel.fromJson(Map<String, dynamic> json) => ItemDetailModel(
    itemId: json["item_id"] == null ? "nodata" : json["item_id"],
    itemName: json["item_name"] == null ? "nodata" : json["item_name"],
    packageId: json["package_id"] == null ? "nodata" : json["package_id"],
    packageName: json["package_name"] == null ? "nodata" : json["package_name"],
    itemQty: json["item_qty"] == null ? "nodata" : json["item_qty"],
    price: json["price"] == null ? "nodata" : json["price"],
    instock: json["instock"] == null ? "nodata" : json["instock"],
    itemImg: json["item_img"] == null ? "nodata" : json["item_img"],
  );

  Map<String, dynamic> toJson() => {
    "item_id": itemId == null ? "nodata" : itemId,
    "item_name": itemName == null ? "nodata" : itemName,
    "package_id": packageId == null ? "nodata" : packageId,
    "package_name": packageName == null ? "nodata" : packageName,
    "item_qty": itemQty == null ? "nodata" : itemQty,
    "price": price == null ? "nodata" : price,
    "instock": instock == null ? "nodata" : instock,
    "item_img": itemImg == null ? "nodata" : itemImg,
  };
}
