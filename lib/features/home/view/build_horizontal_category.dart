import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/constants/temp_data.dart';
import 'package:whole_snack/core/model/temp_model/temp_category_model.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/feature_main/controller/feature_main_controller.dart';
import 'package:whole_snack/features/home/controller/home_controller.dart';
import 'package:whole_snack/features/home/view/build_category_horizontal_single.dart';
import 'package:whole_snack/features/home/view/build_horizontal_category_shimmer.dart';

class BuildHorizontalCategory extends StatelessWidget {
  final SizeConfig mSizeConfig;
  final HomeController mHomeController;
  BuildHorizontalCategory(
      {Key? key, required this.mSizeConfig, required this.mHomeController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    FeatureMainController mFeatureMainController =
        Get.find<FeatureMainController>();
    HomeController mHomeController = Get.find<HomeController>();

    return Container(
      margin: EdgeInsets.only(left: kDefaultMargin),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: kDefaultMargin),
            child: Row(
              children: [
                Text(
                  "Categories",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: kLargeFontSize13.sp),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    mFeatureMainController.changeIndex(1);
                  },
                  style: TextButton.styleFrom(
                      primary: Theme.of(context).primaryColor),
                  child: Text(
                    "see more",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: kSmallFontSize10.sp),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 6.sp,
          ),
          Obx(() {
            return mHomeController.categoryLoading.isTrue
                ? BuildHorizontalCategoryShimmer()
                : mHomeController.categoryLoading.isFalse &&
                        mHomeController.categoryErrorMessage.isNotEmpty
                    ? Center(
                        child: Text('Some Error'),
                      )
                    : Container(
                        height: mSizeConfig.blockSizeVertical * 9.2,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return BuildCategoryHorizontalSingle(
                                mSizeConfig: mSizeConfig,
                                categoryImage: mHomeController
                                    .mCategoryList[index].categImg,
                                categoryTitle: mHomeController
                                    .mCategoryList[index].categName,
                                categoryId: mHomeController
                                    .mCategoryList[index].categId,
                                 index:index
                            );
                          },
                          itemCount: mHomeController.mCategoryList.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                        ),
                      );
          })
        ],
      ),
    );
  }
}
