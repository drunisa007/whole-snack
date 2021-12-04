import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/item_detail_model.dart';
import 'package:whole_snack/core/model/data_model/item_detail_noimage_model.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/core/repos/item_detail_repo.dart';

class ItemController extends GetxController{

///top banner
  RxDouble bannerIndex = 0.0.obs;


  changeBannerCurrentIndex(double value){
    bannerIndex.value =value;
  }


  /// item selected value
    RxInt itemSelectedIndex= RxInt(-1);

  changeItemSelectedIndex(int index ){
    itemSelectedIndex.value = index;
  }



  /// for fetching detail

  ItemDetailRepo _itemDetailRepo = Get.find<ItemDetailRepo>();
  RxString errorMessage = RxString("");
  RxBool showLoading = RxBool(false);

  RxList<ItemDetailNoImageModel> mItemDetailNoImage = RxList();
  RxList<String> mItemDetailImages = RxList();
  RxList<int> mItemDetailImageInt = RxList();

  fetchItemDetail(String itemId) async {
    mItemDetailNoImage.clear();
    mItemDetailImageInt.clear();
    mItemDetailImages.clear();
   showLoading.value = true;

    HttpGetResult<ItemDetailModel> result =
    await _itemDetailRepo.getItemDetail(itemId);
    if (result.isSuccessful) {
      for (ItemDetailModel mModel in result.mData) {
        if (mModel.itemImg=="nodata") {
          mItemDetailNoImage.add(ItemDetailNoImageModel(
              itemId: mModel.itemId,
              itemName: mModel.itemName,
              packageName: mModel.packageName,
              itemQty: mModel.itemQty,
              price: mModel.price,
              instock: mModel.instock,
              packageId: mModel.packageId));
        }
        else {
          String imageName = mModel.itemImg;
          // String find = "localhost/DailyMdy/";
          // String replace = "https://seinwholesale.com/";
          // String newImage = tempImageName.replaceAll(find, replace);
          mItemDetailImages.add(imageName);
        }
      }

      mItemDetailImageInt.clear();
      for (int i = 1; i <= mItemDetailImages.length; i++) {
        mItemDetailImageInt.add(i);
      }

    }
    else {
      errorMessage.value = result.errorMessage;
    }

    showLoading.value = false;
  }

}