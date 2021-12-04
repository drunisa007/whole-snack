

class ItemDetailNoImageModel{
  String itemId;
  String itemName;
  String packageName;
  String itemQty;
  String price;
  String instock;
  String packageId;

  ItemDetailNoImageModel({
    required this.itemId,
    required this.packageId,
    required this.itemName,
    required this.packageName,
    required this.itemQty,
    required this.price,
    required this.instock
  });
}