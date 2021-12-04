import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/get_category_image.dart';
import 'package:whole_snack/core/utils/size_config.dart';

class BuildCategoryHorizontalSingle extends StatelessWidget {
  final SizeConfig mSizeConfig;
  final String categoryImage;
  final String categoryTitle;
  final String categoryId;

  BuildCategoryHorizontalSingle({
    Key? key,
    required this.mSizeConfig,
    required this.categoryImage,
    required this.categoryTitle,
    required this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

   String categoryImage = getCategoryImage(categoryTitle);

    return Container(
      width: mSizeConfig.blockSizeVertical * 9.2,
      height: mSizeConfig.blockSizeVertical * 9.2,
      margin: EdgeInsets.only(right: kDefaultMargin+2.sp),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryVariant,
          borderRadius: BorderRadius.circular(5.sp)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(categoryImage,
            width: mSizeConfig.blockSizeVertical * 3,
            height: mSizeConfig.blockSizeVertical * 3,
            fit: BoxFit.fill,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
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
    );
  }
}
