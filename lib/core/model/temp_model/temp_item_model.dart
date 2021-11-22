import 'package:whole_snack/core/model/temp_model/temp_item_package_model.dart';

class TempItemModel{
  late String image;
  late String title;
  late String originalPrice;
  late List<TempItemPackageModel> packages;

  TempItemModel(this.image, this.title, this.originalPrice, this.packages);

}