import 'package:whole_snack/core/model/temp_model/temp_addtocart_model.dart';
import 'package:whole_snack/core/model/temp_model/temp_category_model.dart';
import 'package:whole_snack/core/model/temp_model/temp_item_model.dart';
import 'package:whole_snack/core/model/temp_model/temp_item_package_model.dart';

List<String> zBannerImages = [
  'https://dl.dropbox.com/s/gznbwm1xyoubdxb/banner1.jpg?dl=0',
  'https://dl.dropbox.com/s/jnt284qnxa2lioa/banner2.jpg?dl=0',
  'https://dl.dropbox.com/s/2q1pcroa3xog6ef/office.jpg?dl=0'
];

List<String> zItemBannerImages = [
  'https://dl.dropbox.com/s/2mua2ebuxuyiqan/apolo.jpeg?dl=0',
  'https://dl.dropbox.com/s/yimglu6x07trjlf/snacktwo.jpeg?dl=0',
  'https://assets.balvi.com/spree/products/7616/large/24243.jpg?1521163643'
];

List<TempCategoryModel> zRealCategoryData = [
  TempCategoryModel("Bestsellers", "assets/images/best_sellers.svg"),
  TempCategoryModel("Promotions", "assets/images/promotions.svg"),
  TempCategoryModel("Liquor", "assets/images/liquor.svg"),
  TempCategoryModel("Snacks", "assets/images/snacks.svg"),
  TempCategoryModel("Drinks", "assets/images/drinks.svg"),
  TempCategoryModel("Health&Beauty", "assets/images/health.svg"),
  TempCategoryModel("Kitchen", "assets/images/kitchen.svg"),
  TempCategoryModel("Dairy Product", "assets/images/dairy.svg"),
  TempCategoryModel("Cigarette", "assets/images/cigarette.svg"),
];

List<TempCategoryModel> zCategoryData = [
  TempCategoryModel("Liquor", "assets/images/liquor.svg"),
  TempCategoryModel("Snacks", "assets/images/snacks.svg"),
  TempCategoryModel("Drinks", "assets/images/drinks.svg"),
  TempCategoryModel("Health & Beauty", "assets/images/health.svg"),
  TempCategoryModel("Kitchen", "assets/images/kitchen.svg"),
  TempCategoryModel("Dairy Product", "assets/images/dairy.svg"),
  TempCategoryModel("Cigarette", "assets/images/cigarette.svg"),
];
List<TempItemModel> zItemData = [
  TempItemModel("https://dl.dropbox.com/s/2mua2ebuxuyiqan/apolo.jpeg?dl=0",
      "Apollo Layer  Cake Layer Cake", "1 pc - Ks.200", [
    TempItemPackageModel("3pcs", "500"),
    TempItemPackageModel("6pcs", "1200"),
    TempItemPackageModel("12pcs/1box", "2500")
  ]),
  TempItemModel("https://dl.dropbox.com/s/yimglu6x07trjlf/snacktwo.jpeg?dl=0",
      "Britannia Layer Cake", "1 pc - Ks.400", [
    TempItemPackageModel("3pcs", "1000"),
    TempItemPackageModel("6pcs", "2000"),
    TempItemPackageModel("12pcs/1box", "3000")
  ]),
  TempItemModel("https://dl.dropbox.com/s/2mua2ebuxuyiqan/apolo.jpeg?dl=0",
      "Dan Vanilla Cake", "1 pc - Ks.300", [
    TempItemPackageModel("2pcs", "400"),
    TempItemPackageModel("4pcs", "1000"),
    TempItemPackageModel("8pcs/1box", "2000")
  ]),
];

List<TempAddToCartModel> zAddToCartList = [
  TempAddToCartModel(
    "https://dl.dropbox.com/s/2mua2ebuxuyiqan/apolo.jpeg?dl=0",
    "Apollo Cake",
    "1 pc - Ks.200",
    TempItemPackageModel("3pcs", "500"),
    1,
  ),
  TempAddToCartModel(
    "https://dl.dropbox.com/s/yimglu6x07trjlf/snacktwo.jpeg?dl=0",
    "Dan Vanilla Cake",
    "1 pc - Ks.400",
    TempItemPackageModel("6pcs", "2000"),
    1,
  ),
  TempAddToCartModel(
    "https://assets.balvi.com/spree/products/7616/large/24243.jpg?1521163643",
    "Dan Layer Corn",
    "1 pc - Ks.300",
    TempItemPackageModel("8pcs/1box", "2000"),
    1,
  )
];

List<TempItemPackageModel> zTempItemPackageList = [
  TempItemPackageModel("2pcs", "400"),
  TempItemPackageModel("4pcs", "1000"),
  TempItemPackageModel("8pcs/1box", "2000"),
];

List<TempCategoryModel> zTypeList = [
  TempCategoryModel("Pop Corns",
      "https://assets.balvi.com/spree/products/7616/large/24243.jpg?1521163643"),
  TempCategoryModel(
      "Biscuits", "https://cf.shopee.ph/file/eea88329fc3d1dcd7b571302f2d34cac"),
  TempCategoryModel("Cookies",
      "https://image.freepik.com/free-photo/corn-flakes-bowl-isolated_127657-13636.jpg"),
  TempCategoryModel("Pies",
      "https://assets.balvi.com/spree/products/7616/large/24243.jpg?1521163643"),
  TempCategoryModel("Sweets",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMXWUkoXe8DmuUd0K11Fc8CoBtHPHuPEhSU0FrcM1cqT3SuaAksgu7ZC5DnlXaXTHmlqU&usqp=CAU"),
  TempCategoryModel("Cereals",
      "https://image.freepik.com/free-photo/corn-flakes-bowl-isolated_127657-13636.jpg"),
  TempCategoryModel(
      "IceCream", "https://cf.shopee.ph/file/eea88329fc3d1dcd7b571302f2d34cac"),
];
