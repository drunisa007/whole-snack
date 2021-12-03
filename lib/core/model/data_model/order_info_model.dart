import 'dart:convert';

List<OrderInfoModel> orderInfoModelFromJson(String str) => List<OrderInfoModel>.from(json.decode(str).map((x) => OrderInfoModel.fromJson(x)));

String orderInfoModelToJson(List<OrderInfoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderInfoModel {
  OrderInfoModel({
    required this.ordId,
    required this.ordNo,
    required this.ordCreate,
    required this.ordShip,
    required this.ordAccept,
    required this.ordDelivered,
    required this.ordPrice,
    required this.ordPhone,
    required this.ordAddress,
    required this.ordStatus,
    required this.deliveryFee,
    required this.riderPhone,
    required this.ordType,
    required this.cusId,
    required this.regId,
    required this.regName,
  });

  String ordId;
  String ordNo;
  DateTime ordCreate;
  String ordShip;
  String ordAccept;
  String ordDelivered;
  String ordPrice;
  String ordPhone;
  String ordAddress;
  String ordStatus;
  String deliveryFee;
  dynamic riderPhone;
  String ordType;
  String cusId;
  String regId;
  String regName;

  factory OrderInfoModel.fromJson(Map<String, dynamic> json) => OrderInfoModel(
    ordId: json["ord_id"],
    ordNo: json["ord_no"],
    ordCreate: DateTime.parse(json["ord_create"]),
    ordShip: json["ord_ship"],
    ordAccept: json["ord_accept"],
    ordDelivered: json["ord_delivered"],
    ordPrice: json["ord_price"],
    ordPhone: json["ord_phone"],
    ordAddress: json["ord_address"],
    ordStatus: json["ord_status"],
    deliveryFee: json["delivery_fee"],
    riderPhone: json["rider_phone"],
    ordType: json["ord_type"],
    cusId: json["cus_id"],
    regId: json["reg_id"],
    regName: json["reg_name"],
  );

  Map<String, dynamic> toJson() => {
    "ord_id": ordId,
    "ord_no": ordNo,
    "ord_create": ordCreate.toIso8601String(),
    "ord_ship": ordShip,
    "ord_accept": ordAccept,
    "ord_delivered": ordDelivered,
    "ord_price": ordPrice,
    "ord_phone": ordPhone,
    "ord_address": ordAddress,
    "ord_status": ordStatus,
    "delivery_fee": deliveryFee,
    "rider_phone": riderPhone,
    "ord_type": ordType,
    "cus_id": cusId,
    "reg_id": regId,
    "reg_name": regName,
  };
}
