import 'package:get/get.dart';

class HomeController extends GetxController{
   RxDouble bannerIndex = 0.0.obs;


   changeBannerCurrentIndex(double value){
     bannerIndex.value =value;
   }
}