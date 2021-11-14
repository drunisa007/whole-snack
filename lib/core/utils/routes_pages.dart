import 'package:get/get.dart';
import 'package:whole_snack/features/feature_main/binding/feature_main_binding.dart';
import 'package:whole_snack/features/feature_main/view/feature_main.dart';

class RoutePage {
  var routePage = [
    GetPage(
        name: '/',
        page: () => const FeatureMain(),
        binding: FeatureMainBinding()),
  ];
}
