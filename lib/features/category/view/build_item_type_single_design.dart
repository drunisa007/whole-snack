import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/data_model/type_model.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/category/controller/category_controller.dart';
import 'package:whole_snack/features/category/view/build_smart_refresher_for_grid.dart';

class BuildItemTypeSingleDesign extends StatelessWidget {
  final int index;

  const BuildItemTypeSingleDesign({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    CategoryController mCategoryController = Get.find<CategoryController>();

    TypeModel mModel = mCategoryController.mTypeList[index];

    SizeConfig mSizeConfig = Get.find<SizeConfig>();

      return Container(
        width: double.infinity,
        height: mSizeConfig.safeBlockVertical * 50 - kToolbarHeight,
        child:
                // mCategoryController.typeLoading.isTrue
                //     ? BuildItemTypeSingleShimmer()
                //
                //:
           SingleChildScrollView(
             child: Column(
                   children: [
                     SizedBox(
                       height: 4.sp,
                     ),
                     Text(mModel.typeName,
                         style: TextStyle(
                             fontSize: kMediumFontSize12.sp,
                             fontWeight: FontWeight.w600,
                             color: Theme.of(context).colorScheme.onPrimary)),
                     SizedBox(
                       height: 10.sp,
                     ),
                     BuildSmartRefresherForGrid(mainIndex:index),
                   ],
                  ),
           )
            );

  }
}
