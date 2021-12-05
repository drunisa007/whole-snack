import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/category_item_list_model.dart';
import 'package:whole_snack/core/model/data_model/category_model.dart';
import 'package:whole_snack/core/model/data_model/item_model.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/core/repos/category_repo.dart';
import 'package:whole_snack/core/repos/item_repo.dart';
import 'package:whole_snack/features/category/controller/category_controller.dart';

class HomeController extends GetxController {
  @override
  Future<void> onInit() async {
    await fetchingCategory();
    super.onInit();
  }

  /// for banner index change
  RxDouble bannerIndex = 0.0.obs;

  changeBannerCurrentIndex(double value) {
    bannerIndex.value = value;
  }

  /// repo for category

  late CategoryRepo mCategoryRepo;
  CategoryController mCategoryController = Get.find<CategoryController>();

  RxList<CategoryModel> mCategoryList = RxList();
  RxString categoryErrorMessage = "".obs;
  RxBool categoryLoading = true.obs;

  fetchingCategory() async {
    mCategoryRepo = Get.find<CategoryRepo>();
    categoryLoading.value = true;
    HttpGetResult<CategoryModel> mResult = await mCategoryRepo.getCategory();

    if (mResult.isSuccessful) {
      categoryErrorMessage.value = "";
      mCategoryList.addAll(mResult.mData);
      if (mCategoryList.isNotEmpty) {
        String categoryId = mCategoryList[0].categId;
        mCategoryController.onLoad.value = false;
        mCategoryController.changeCategoryId(categoryId);
        mCategoryController.changeCategoryIndex(0, categoryId);
        categoryLoading.value = false;

        fetchingAllItemBasedOnCategoryList(firstTime: true,refreshLoad: false);



        // mCategoryController.fetchingType(categoryId);
        // mCategoryController.mainCategoryId.value = categoryId;
        // mCategoryController.fetchingItemList(categoryId, true);
      }
    } else {
      categoryErrorMessage.value =
          "Please check your internet connection or refresh";
      mCategoryList = RxList();
      categoryLoading.value = false;

    }
  }

  RxList<CategoryItemListModel> mCategoryItemList = RxList();

  ItemRepo mItemRepo = Get.find<ItemRepo>();

  /// for home fetching category list

  fetchingAllItemBasedOnCategoryList({required bool refreshLoad,required bool firstTime,index}) async {

    if(firstTime){
      for (int i = 0; i < mCategoryList.length; i++) {
        mCategoryItemList.add(CategoryItemListModel(
          mItemList: [],
          itemErrorMessage: "",
          itemLoading: true,
          totalPage: 1,
          currentPage: 1,
          onLoad: false,
          title: mCategoryList[i].categName,
        ));
      }
      for (int x = 0; x < mCategoryItemList.length; x++) {
        CategoryItemListModel mModel = mCategoryItemList[x];

        fetchingItemListSingleData(mModel,x);
      }

    }
    else{

      CategoryItemListModel mModel = mCategoryItemList[index];

      if(refreshLoad){
        mModel.mItemList.clear();
        mModel.currentPage = 1;
        fetchingItemListSingleData(mModel, index);
      }
      else{
        await fetchingItemListSingleData(mModel, index);
      }
    }



  }


  fetchingItemListSingleData(CategoryItemListModel mModel,int index) async {


    print("current page ${mModel.currentPage} total page ${mModel.totalPage}");
    if (mModel.currentPage <= mModel.totalPage) {
      HttpGetResult<ItemModel> mResult;

      mResult = await mItemRepo.getItemList(
          mCategoryList[index].categId, mModel.currentPage);

      if (mResult.isSuccessful) {
        mModel.itemErrorMessage = "";
        mModel.totalPage = int.parse(mResult.errorMessage);
        mModel.mItemList.addAll(mResult.mData);
        mModel.currentPage = mModel.currentPage + 1;
        mModel.itemLoading = false;

        mCategoryItemList[index] = mModel;
      } else {
        mModel.itemErrorMessage =
        "Please check your internet connection or refresh";
        mModel.mItemList = [];
        mModel.itemLoading = false;

        mCategoryItemList[index] = mModel;
      }
    }
  }

}
