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

 late RxString mainCategoryId=RxString("");

 changeCategoryId(String categoryId){
   mainCategoryId.value = categoryId;

 }

  changeCategoryIndex(int index,String id) {
    print("category id is "+id);
    if (index != selectedCategoryIndex.value) {
      selectedPrevent.value = true;
      selectedCategoryIndex.value = index;
      selectedTypeId.value = "";

      if(id==mainCategoryId.value){
        mainCategoryId.value =id;
        fetchingType(id);
        fetchingItemList(id,true);
      }
      else{
          selectedTypeIndex.value = -1;
          mainCategoryId.value =id;
          fetchingType(id);
          fetchingItemList(id,false);
      }
    }
  }

  ///type selected index
  RxInt selectedTypeIndex = RxInt(-1);
  late RxString selectedTypeId=RxString("");

  changeTypeIndex(int index) {
    selectedPrevent.value = true;
    selectedTypeIndex.value = index;
    if(selectedTypeId.value==mTypeList[index].typeId){
      print("select type id is already exist");
      fetchingItemList(mainCategoryId.value,true,typeId:selectedTypeId.value);
      selectedTypeId.value = mTypeList[index].typeId;
    }
    else{
      print("select type id is already not exist");
      selectedTypeId.value = mTypeList[index].typeId;
      fetchingItemList(mainCategoryId.value,false,typeId:selectedTypeId.value);
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

    ///loading == true mean load list value false mean refresh list value

  fetchingItemList(categoryId,bool loading,{String typeId=""}) async {

    if(!loading){
      mItemList.clear();
      currentPage.value = 1;
    }

    itemLoading.value = true;

    if(currentPage.value<=totalPage.value){
      HttpGetResult<ItemModel> mResult;
      if(typeId.isEmpty){
        mResult = await mItemRepo.getItemList(categoryId,currentPage);
      }
      else{
        mResult = await mItemRepo.getItem(categoryId,typeId,currentPage);
      }
      print("mResult $mResult");
      itemLoading.value = false;

      if (mResult.isSuccessful) {
        itemErrorMessage.value = "";
        totalPage.value = int.parse(mResult.errorMessage);
        mItemList.addAll(mResult.mData);
        currentPage.value  = currentPage.value +1;
        print("current page is ${currentPage.value} ${totalPage.value}");
      } else {
        itemErrorMessage.value =
        "Please check your internet connection or refresh";
        mItemList = RxList();
      }
      selectedPrevent.value = false;
    }

  }

}
