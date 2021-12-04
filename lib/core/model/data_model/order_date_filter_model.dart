import 'dart:convert';

OrderDateFilterModel orderDateFilterModelFromJson(String str) =>
    OrderDateFilterModel.fromJson(json.decode(str));

String orderDateFilterModelToJson(OrderDateFilterModel data) =>
    json.encode(data.toJson());

class OrderDateFilterModel {
  OrderDateFilterModel({
    required this.customerId,
    required this.from,
    required this.to,
  });

  String customerId;
  String from;
  String to;

  factory OrderDateFilterModel.fromJson(Map<String, dynamic> json) =>
      OrderDateFilterModel(
        customerId: json["customer_id"],
        from: json["from"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() =>
      {"customer_id": customerId, "from": from, "to": to};
}
