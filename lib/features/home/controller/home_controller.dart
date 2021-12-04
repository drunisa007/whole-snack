import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/category_model.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/core/repos/category_repo.dart';
import 'package:whole_snack/features/category/controller/category_controller.dart';

class HomeController extends GetxController{

   @override
  Future<void> onInit()async {
    await fetchingCategory();
    super.onInit();
  }

  /// for banner index change
  RxDouble bannerIndex = 0.0.obs;

   changeBannerCurrentIndex(double value){
     bannerIndex.value =value;
   }

   /// repo for category

  late CategoryRepo mCategoryRepo;
   CategoryController mCategoryController = Get.find<CategoryController>();

  RxList<CategoryModel> mCategoryList = RxList();
  RxString categoryErrorMessage = "".obs;
  RxBool categoryLoading = false.obs;

  fetchingCategory() async {
    print("fetch cateogry this is calling");
    mCategoryRepo  = Get.find<CategoryRepo>();
    categoryLoading.value = true;
    HttpGetResult<CategoryModel> mResult = await  mCategoryRepo.getCategory();
    categoryLoading.value =false;

    if(mResult.isSuccessful){
        categoryErrorMessage.value = "";
        mCategoryList.addAll(mResult.mData);
        if(mCategoryList.isNotEmpty){
          String categoryId =mCategoryList[0].categId;
          //mCategoryController.onLoad.value = false;
          mCategoryController.selectedCategoryId.value = categoryId;
          mCategoryController.changeCategoryIndex(0);
          // mCategoryController.fetchingType(categoryId);
          // mCategoryController.mainCategoryId.value = categoryId;
          // mCategoryController.fetchingItemList(categoryId, true);
        }

    }
    else{
      categoryErrorMessage.value = "Please check your internet connection or refresh";
      mCategoryList  = RxList();
    }
  }

}