import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';

class BuildCategoryHorizontalSingle extends StatelessWidget {
  final SizeConfig mSizeConfig;
  final String categoryImage;
  final String categoryTitle;

  BuildCategoryHorizontalSingle({
    Key? key,
    required this.mSizeConfig,
    required this.categoryImage,
    required this.categoryTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mSizeConfig.blockSizeVertical * 10.3,
      height: mSizeConfig.blockSizeVertical * 10.3,
      margin: EdgeInsets.only(right: kDefaultMargin+2),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryVariant,
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: mSizeConfig.blockSizeVertical*2,
          ),
          SvgPicture.asset(
            "$categoryImage",
            width: mSizeConfig.blockSizeVertical * 3.3,
            height: mSizeConfig.blockSizeVertical * 3.3,
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
                  fontSize: categoryTitle.length>11?11.sp:kLargeFontSize14.sp,
                  letterSpacing: categoryTitle.length>11?0.05:0.5,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
          )
        ],
      ),
    );
  }
}
