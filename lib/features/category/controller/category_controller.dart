import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/type_model.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/core/repos/type_repo.dart';

class CategoryController extends GetxController {
  ///category selected index
  RxInt selectedCategoryIndex = RxInt(0);

  changeCategoryIndex(int index,String id) {
    if (index != selectedCategoryIndex.value) {
      selectedCategoryIndex.value = index;
      fetchingType(id);
    }
  }

  ///type selected index
  RxInt selectedTypeIndex = RxInt(-1);
  late RxString selectedTypeId;

  changeTypeIndex(int index) {
    selectedTypeIndex.value = index;
    selectedTypeId.value = mTypeList[index].typeId;
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

    if (mResult.isSuccessful) {
      typeErrorMessage.value = "";
      mTypeList.addAll(mResult.mData);
    } else {
      typeErrorMessage.value =
          "Please check your internet connection or refresh";
      mTypeList = RxList();
    }
  }
}
