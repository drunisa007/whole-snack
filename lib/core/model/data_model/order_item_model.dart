import 'dart:convert';

List<OrderItemModel> orderItemModelFromJson(String str) => List<OrderItemModel>.from(json.decode(str).map((x) => OrderItemModel.fromJson(x)));

String orderItemModelToJson(List<OrderItemModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderItemModel {
  OrderItemModel({
    required this.packageName,
    required this.itemName,
    required this.qty,
    required this.price,
    required this.itemImage,
  });

  String packageName;
  String itemName;
  String qty;
  String price;
  String itemImage;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => OrderItemModel(
    packageName: json["package_name"],
    itemName: json["item_name"],
    qty: json["qty"],
    price: json["price"],
    itemImage: json["item_image"],
  );

  Map<String, dynamic> toJson() => {
    "package_name": packageName,
    "item_name": itemName,
    "qty": qty,
    "price": price,
    "item_image": itemImage,
  };
}
