import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class ItemDetailModel {
  @HiveField(0)
  late String id;
  @HiveField(1)
  late String image;

  @HiveField(2)
  late String title;

  @HiveField(3)
  late String description;

  @HiveField(4)
  late String price;

  @HiveField(5)
  late bool fav;

  ItemDetailModel(
      {required this.id,
      required this.image,
      required this.title,
      required this.description,
      required this.price,
      required this.fav});
}