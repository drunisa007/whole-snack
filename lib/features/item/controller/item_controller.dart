import 'package:get/get.dart';

class ItemController extends GetxController{

///top banner
  RxDouble bannerIndex = 0.0.obs;


  changeBannerCurrentIndex(double value){
    bannerIndex.value =value;
  }


  /// item selected value
///
    RxInt itemSelectedIndex= RxInt(-1);

  changeItemSelectedIndex(int index ){
    itemSelectedIndex.value = index;
  }
}