import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/temp_model/temp_item_model.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/build_item_single_grid.dart';
import 'package:whole_snack/features/category/controller/category_controller.dart';
import 'package:whole_snack/features/home/controller/home_controller.dart';

class BuildItemTypeSingleDesign extends StatelessWidget {
  final String itemTypeTitle;
  final List<TempItemModel> mItemList;
  final SizeConfig mSizeConfig;
  final HomeController mHomeController;

  const BuildItemTypeSingleDesign({
    Key? key,
    required this.itemTypeTitle,
    required this.mItemList,
    required this.mSizeConfig,
    required this.mHomeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RefreshController _refreshController =
        RefreshController(initialRefresh: false);
    CategoryController mCategoryController = Get.find<CategoryController>();

    void _onRefresh() async {
      if(mCategoryController.selectedTypeId.isNotEmpty){
        await mCategoryController.fetchingItemList(mCategoryController.mainCategoryId.value,false,typeId:mCategoryController.selectedTypeId.value);
      }
      else{
        await mCategoryController.fetchingItemList(mCategoryController.mainCategoryId.value,false);
      }
      _refreshController.refreshCompleted();
    }

    void _onLoading() async {

      if(mCategoryController.selectedTypeId.isNotEmpty){
        await mCategoryController.fetchingItemList(mCategoryController.mainCategoryId.value,true,typeId:mCategoryController.selectedTypeId.value);
      }
      else{
        await mCategoryController.fetchingItemList(mCategoryController.mainCategoryId.value,true);
      }


      _refreshController.loadComplete();
    }

    return Obx((){
      return SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: WaterDropHeader(),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1/1.25),
            itemCount: mCategoryController.mItemList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return BuildItemSingleGrid(
                currentIndex: index,
                mSizeConfig: mSizeConfig,
                mHomeController: mHomeController,
                image: mCategoryController.mItemList[index].img,
                title: mCategoryController.mItemList[index].itemName,
                originalPrice: mCategoryController.mItemList[index].price,
                firstPackages: mCategoryController.mItemList[index].packageName,
                quantity: mCategoryController.mItemList[index].price,
                itemId: mCategoryController.mItemList[index].itemId,
              );
            },
          )
      );
    });
  }
}
