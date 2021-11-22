import 'package:get/get.dart';
import 'package:whole_snack/features/feature_main/binding/feature_main_binding.dart';
import 'package:whole_snack/features/feature_main/view/feature_main.dart';
import 'package:whole_snack/features/item/binding/item_binding.dart';
import 'package:whole_snack/features/item/view/item_page.dart';

class RoutePage {
  var routePage = [
    GetPage(
        name: '/',
        page: () => const FeatureMain(),
        binding: FeatureMainBinding()),
    GetPage(
        name: '/item-page',
        page: () => const ItemPage(),
        binding: ItemBinding()),
  ];
}
