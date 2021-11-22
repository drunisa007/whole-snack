import 'package:whole_snack/core/model/temp_model/temp_item_package_model.dart';

class TempAddToCartModel{
  late String image;
  late String title;
  late String originalPrice;
  late TempItemPackageModel itemPackage;
  late int count;

  TempAddToCartModel(
      this.image, this.title, this.originalPrice, this.itemPackage, this.count);
}