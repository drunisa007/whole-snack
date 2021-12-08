import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/build_item_single.dart';
import 'package:whole_snack/features/category/controller/category_controller.dart';
import 'package:whole_snack/features/feature_main/controller/feature_main_controller.dart';
import 'package:whole_snack/features/feature_main/view/feature_main.dart';
import 'package:whole_snack/features/home/controller/home_controller.dart';
import 'package:whole_snack/features/home/view/build_category_all_items_shimmer.dart';

class BuildHorizontalItems extends StatelessWidget {
  final bool haveSeeMore;
  final int index;
  BuildHorizontalItems(
      {Key? key, required this.haveSeeMore, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);

    HomeController mHomeController = Get.find<HomeController>();

    CategoryController mCategoryController = Get.find<CategoryController>();

    FeatureMainController mFeatureController = Get.find<FeatureMainController>();

    RefreshController _refreshController =
        RefreshController(initialRefresh: false);

    void _onRefresh() async {
      await Future.delayed(Duration(milliseconds: 2000));
    }


    void _onLoading() async {

       mHomeController.fetchingAllItemBasedOnCategoryList(
        refreshLoad: false,
        firstTime: false,
        index: index);
       await Future.delayed(Duration(milliseconds: 1000));
       _refreshController.loadComplete();

    }

    return Container(
      margin: EdgeInsets.only(left: kDefaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: kDefaultMargin),
            child: Row(
              children: [
                Text(
                  "${mHomeController.mCategoryItemList[index].title}",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: kExtraLargeFontSize15.sp),
                ),
                Spacer(),
                haveSeeMore
                    ? TextButton(
                        onPressed: () {
                          if(mCategoryController.selectedPrevent.isFalse){
                            mCategoryController.changeCategoryIndex(index,mHomeController.mCategoryList[index].categId);
                            mFeatureController.changeIndex(1);
                          }
                        },
                        style: TextButton.styleFrom(
                            primary: Theme.of(context).primaryColor),
                        child: Text(
                          "see more",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: kSmallFontSize10.sp),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          SizedBox(
            height: 6.sp,
          ),
          Obx(() {
            return mHomeController.mCategoryItemList[index].itemLoading
                ? BuildCategoryAllItemsShimmer()
                : Container(
                    height: mSizeConfig.blockSizeVertical * 22,
                    child: SmartRefresher(
                      enablePullDown: false,
                      enablePullUp: true,
                      header: GetPlatform.isAndroid
                          ? WaterDropMaterialHeader()
                          : WaterDropHeader(),
                      footer: CustomFooter(
                        builder: (BuildContext context, LoadStatus? mode) {
                          Widget body;
                          if (mode == LoadStatus.idle) {
                            body = Text("");
                          } else if (mode == LoadStatus.loading) {
                            body = GetPlatform.isAndroid
                                ? CircularProgressIndicator()
                                : CupertinoActivityIndicator();
                          } else if (mode == LoadStatus.failed) {
                            body = Text("");
                          } else if (mode == LoadStatus.canLoading) {
                            body = Text("");
                          }
                          else if(mode==LoadStatus.noMore){
                            body = Text("");
                          }
                          else {
                            body = Text("");
                          }

                          return Container(
                            margin: EdgeInsets.only(left: 4.sp, right: 2.sp),
                            child: Center(child: body),
                          );
                        },
                      ),
                      controller: _refreshController,
                      onRefresh: _onRefresh,
                      onLoading: _onLoading,
                      child: ListView.builder(
                        itemBuilder: (context, currentIndex) {
                          return BuildItemSingle(
                              currentIndex: currentIndex, mainIndex: index);
                        },
                        itemCount: mHomeController
                            .mCategoryItemList[index].mItemList.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                      ),
                    ),
                  );
          })
        ],
      ),
    );
  }
}
