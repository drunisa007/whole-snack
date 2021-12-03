import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';

class BuildHorizontalCategoryShimmer extends StatelessWidget {
  const BuildHorizontalCategoryShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);

    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.primaryVariant,
      highlightColor: Colors.grey[400]!,
      enabled: true,
      child: Container(
        height: mSizeConfig.blockSizeVertical * 9.2,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return BuildCategoryHorizontalSingleShimmer(
              mSizeConfig: mSizeConfig,
            );
          },
          itemCount: 7,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
        ),
      ),
    );
  }
}

class BuildCategoryHorizontalSingleShimmer extends StatelessWidget {
  final SizeConfig mSizeConfig;
  BuildCategoryHorizontalSingleShimmer({
    Key? key,
    required this.mSizeConfig,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mSizeConfig.blockSizeVertical * 9.2,
      height: mSizeConfig.blockSizeVertical * 9.2,
      margin: EdgeInsets.only(right: kDefaultMargin + 2.sp),
      decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.primaryVariant,
          borderRadius: BorderRadius.circular(5.sp)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: mSizeConfig.blockSizeVertical * 5,
            height: mSizeConfig.blockSizeVertical * 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.sp),
              color: Colors.white,
            ),

          ),
          SizedBox(
            height: 4.sp,
          ),
          Padding(
            padding: EdgeInsets.only(left: 1, right: 1),
            child: Container(
              width: mSizeConfig.blockSizeVertical * 6,
              height: mSizeConfig.blockSizeVertical * 1.3,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
