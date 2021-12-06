import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/category_item_list_model.dart';
import 'package:whole_snack/core/widgets/appbar/build_horizontal_items.dart';
import 'package:whole_snack/features/home/controller/home_controller.dart';

class BuildCategoryAllItems extends StatelessWidget {
  const BuildCategoryAllItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController mHomeController = Get.find<HomeController>();

    return Obx(() {
      return mHomeController.categoryLoading.isTrue?Container():ListView.separated(
        itemBuilder: (context, index) {

          return BuildHorizontalItems(
            haveSeeMore: true,
            index:index
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 8.sp,
          );
        },
        itemCount: mHomeController.mCategoryItemList.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
      );
    });
  }
}
