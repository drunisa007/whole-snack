import 'package:get/get.dart';
import 'package:whole_snack/core/constants/temp_data.dart';
import 'package:whole_snack/core/model/temp_model/temp_addtocart_model.dart';

class CartController extends GetxController{

  ///for add to cart list

  RxList<TempAddToCartModel>  mAddToCartList = RxList();

  @override
  void onInit() {
    super.onInit();
    mAddToCartList.addAll(zAddToCartList);
  }
}