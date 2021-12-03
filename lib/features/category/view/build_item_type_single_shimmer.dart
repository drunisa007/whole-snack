import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';

class BuildItemTypeSingleShimmer extends StatelessWidget {
  const BuildItemTypeSingleShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.primaryVariant,
      highlightColor: Colors.grey[400]!,
      enabled: true,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 4.sp,mainAxisSpacing: 8.sp, crossAxisCount: 2, childAspectRatio: 1 / 1.25),
        itemCount: 6,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return BuildItemSingleShimmerGrid();
        },
      ),
    );
  }
}

class BuildItemSingleShimmerGrid extends StatelessWidget {
  const BuildItemSingleShimmerGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig mSizeConfig = Get.find<SizeConfig>();

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(right: kDefaultMargin.sp),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.sp)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: mSizeConfig.blockSizeVertical * 10,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6.sp),
                topRight: Radius.circular(6.sp),
              ),
            ),
          ),
          SizedBox(
            height: 4.sp,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(right: 30.sp),
                  height: mSizeConfig.blockSizeVertical * 2.8,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 2.sp,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(right: 30.sp),
                  height: mSizeConfig.blockSizeVertical * 2.8,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
