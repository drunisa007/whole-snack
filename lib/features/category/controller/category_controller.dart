import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/item_model.dart';
import 'package:whole_snack/core/model/data_model/type_model.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/core/repos/item_repo.dart';
import 'package:whole_snack/core/repos/type_repo.dart';

class CategoryController extends GetxController {
  ///category selected index
  RxInt selectedCategoryIndex = RxInt(-1);

  RxBool selectedPrevent = false.obs;

  late RxString mainCategoryId = RxString("");

  changeCategoryId(String categoryId) {
    mainCategoryId.value = categoryId;
  }

  changeCategoryIndex(int index, String id) async {
    if (index != selectedCategoryIndex.value) {
      selectedPrevent.value = true;
      selectedCategoryIndex.value = index;
      selectedTypeId.value = "";

      if (id == mainCategoryId.value) {
        onLoad.value = true;
        mainCategoryId.value = id;
        fetchingType(id);
        fetchingItemList(id, true);
      } else {
        selectedTypeIndex.value = -1;
        mainCategoryId.value = id;
        onLoad.value = false;
        itemLoading.value = true;
        fetchingType(id);
        fetchingItemList(id, false);
      }
    }
  }

  ///type selected index
  RxInt selectedTypeIndex = RxInt(-1);
  late RxString selectedTypeId = RxString("");

  changeTypeIndex(int index) {
    selectedPrevent.value = true;
    selectedTypeIndex.value = index;
    if (selectedTypeId.value == mTypeList[index].typeId) {
      fetchingItemList(mainCategoryId.value, true,
          typeId: selectedTypeId.value);
      selectedTypeId.value = mTypeList[index].typeId;
      onLoad.value = true;
    } else {
      selectedTypeId.value = mTypeList[index].typeId;
      onLoad.value = false;
      fetchingItemList(mainCategoryId.value, false,
          typeId: selectedTypeId.value);
    }
  }

  ///type list repo

  late RxString selectedCategoryId;

  RxList<TypeModel> mTypeList = RxList();
  RxString typeErrorMessage = "".obs;
  RxBool typeLoading = true.obs;
  TypeRepo mTypeRepo = Get.find<TypeRepo>();

  fetchingType(categoryId) async {
    mTypeList.clear();
    typeLoading.value = true;
    HttpGetResult<TypeModel> mResult = await mTypeRepo.getType(categoryId);
    typeLoading.value = false;
    selectedPrevent.value = false;

    if (mResult.isSuccessful) {
      typeErrorMessage.value = "";
      mTypeList.clear();
      mTypeList.addAll(mResult.mData);
    } else {
      typeErrorMessage.value =
          "Please check your internet connection or refresh";
      mTypeList = RxList();
    }
  }

  ///fetching item list

  RxList<ItemModel> mItemList = RxList();
  RxString itemErrorMessage = "".obs;
  RxBool itemLoading = true.obs;
  ItemRepo mItemRepo = Get.find<ItemRepo>();
  RxInt totalPage = RxInt(1);
  RxInt currentPage = RxInt(1);
  RxBool onLoad = RxBool(false);

  ///loading == true mean load list value false mean refresh list value

  fetchingItemList(categoryId, bool loading, {String typeId = ""}) async {
    itemLoading.value = true;

    if (!loading) {
      mItemList.clear();
      currentPage.value = 1;
    }

    if (currentPage.value <= totalPage.value) {
      HttpGetResult<ItemModel> mResult;
      if (typeId.isEmpty) {
        mResult = await mItemRepo.getItemList(categoryId, currentPage);
      } else {
        mResult = await mItemRepo.getItem(categoryId, typeId, currentPage);
      }

      if (mResult.isSuccessful) {
        itemErrorMessage.value = "";
        totalPage.value = int.parse(mResult.errorMessage);
        mItemList.addAll(mResult.mData);
        currentPage.value = currentPage.value + 1;
        itemLoading.value = false;
      } else {
        itemErrorMessage.value =
            "Please check your internet connection or refresh";
        mItemList = RxList();
        itemLoading.value = false;
      }
      selectedPrevent.value = false;
    }
  }
}
