import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/get_category_image.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/category/controller/category_controller.dart';
import 'package:whole_snack/features/feature_main/controller/feature_main_controller.dart';

class BuildCategoryHorizontalSingle extends StatelessWidget {
  final SizeConfig mSizeConfig;
  final String categoryImage;
  final String categoryTitle;
  final String categoryId;
  final int index;

  BuildCategoryHorizontalSingle({
    Key? key,
    required this.mSizeConfig,
    required this.categoryImage,
    required this.categoryTitle,
    required this.categoryId, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

   //String categoryImage = getCategoryImage(categoryTitle);

    CategoryController mCategoryController = Get.find<CategoryController>();
    FeatureMainController mFeatureMainController = Get.find<FeatureMainController>();

    return GestureDetector(
      onTap: (){
        if(mCategoryController.selectedPrevent.isFalse){
          mCategoryController.changeCategoryIndex(index,categoryId);
          mFeatureMainController.changeIndex(1);
        }
      },
      child: Container(
        width: mSizeConfig.blockSizeVertical * 9.2,
        height: mSizeConfig.blockSizeVertical * 9.2,
        margin: EdgeInsets.only(right: kDefaultMargin+2.sp),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryVariant,
            borderRadius: BorderRadius.circular(5.sp)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              width: mSizeConfig.blockSizeVertical * 3,
              height: mSizeConfig.blockSizeVertical * 3,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6.sp),
                  topRight: Radius.circular(6.sp),
                ),
                child: CachedNetworkImage(
                  imageUrl: categoryImage,
                  placeholder: (context, url) => Image.asset(
                    "assets/images/place_holder.jpeg",
                    fit: BoxFit.cover,
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    "assets/images/place_holder.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // SvgPicture.asset(categoryImage,
            //   width: mSizeConfig.blockSizeVertical * 3,
            //   height: mSizeConfig.blockSizeVertical * 3,
            //   fit: BoxFit.fill,
            //   color: Theme.of(context).colorScheme.onPrimary,
            // ),
            SizedBox(
              height: 4.sp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 1,right: 1),
              child: Text(
                "$categoryTitle",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: kMediumFontSize11.sp,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
            )
          ],
        ),
      ),
    );
  }
}
