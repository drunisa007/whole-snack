import 'package:get/get.dart';
import 'package:whole_snack/core/repos/register_repo.dart';
import 'package:whole_snack/features/cart/controller/cart_controller.dart';

class FeatureMainController extends GetxController{
  /// please list the variable with only applicable variable.

  /// main bottom navigation index login
  late RxInt currentIndex;
    FeatureMainController() {
      currentIndex = 0.obs;
    }

    CartController mCartController = Get.find<CartController>();

    changeIndex(int index) {
      if(mCartController.cartAppBarBackArrow.isTrue){
        Get.back();
        Get.back();
        mCartController.cartAppBarBackArrow.value=  false;
        clearAppbar.value = true;
      }
      currentIndex.value = index;
    }

    int getIndex() {
      return currentIndex.value;
    }

    /// 0 is loading state
    /// 1 is login page state
    /// 2 is main page state
    RxInt authPosition = 0.obs;

    //cart controller

    @override
    void onInit() {
      super.onInit();

    }


    RxList<String> mRouteHistory = RxList();

    RxString startRoute =RxString("");

    RxBool clearAppbar = RxBool(false);


    pushNewRoutesHistory(){
      mRouteHistory.add("first");
    }



}