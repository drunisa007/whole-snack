import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/item_model.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/core/repos/item_repo.dart';
import 'package:whole_snack/core/repos/search_repo.dart';

class SearchController extends GetxController {
  RxBool loading = RxBool(true);
  RxString errorMessage = "".obs;

  RxList<ItemModel> mFilterList = RxList();
  RxList<ItemModel> mSearchList = RxList();

  SearchRepo mSearchRepo = Get.find<SearchRepo>();

  @override
  void onInit() {
    super.onInit();
    fetchingAllSearchList();
  }

  fetchingAllSearchList() async {
    loading.value = true;

    HttpGetResult<ItemModel> mResult;

    mResult = await mSearchRepo.getItemList();

    if (mResult.isSuccessful) {
      mSearchList.addAll(mResult.mData);
      mFilterList.addAll(mResult.mData);
    } else {
      errorMessage.value = "Something went wrong on server";
    }

    loading.value = false;
  }

  filterList(String name) {
    loading.value = true;
    final result = mSearchList
        .where((value) => value.itemName.toLowerCase().contains(name.toLowerCase()))
        .toList();
   mFilterList.clear();
   mFilterList.addAll(result);
   loading.value = false;
  }

  emptyFilterList(){
    mFilterList.addAll(mSearchList);
  }
}
