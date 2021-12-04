
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/type_model.dart';
import 'package:whole_snack/features/category/controller/category_controller.dart';

import 'build_item_type_single_design.dart';
class BuildItemFromAllType extends StatelessWidget {
  const BuildItemFromAllType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    CategoryController mCategoryController = Get.find<CategoryController>();

    return Obx((){
      return mCategoryController.typeLoading.isTrue?CircularProgressIndicator():ListView.separated(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return  BuildItemTypeSingleDesign(
            index:index
          );
        }, separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 20.sp,);
      }, itemCount: mCategoryController.mTypeList.length,
      );
    });
  }
}
