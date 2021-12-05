import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';

class BuildCategoryAllItemsShimmer extends StatelessWidget {
  const BuildCategoryAllItemsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);

    return Container(
      height: mSizeConfig.blockSizeVertical * 20,
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).colorScheme.primaryVariant,
        highlightColor: Colors.grey[400]!,
        enabled: true,
        child: ListView.builder(
          itemBuilder: (context, currentIndex) {
            return BuildItemSingleShimmer();
          },
          itemCount: 8,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
        ),
      )
    );
  }
}

class BuildItemSingleShimmer extends StatelessWidget {
  const BuildItemSingleShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);

    return Container(
      width: mSizeConfig.blockSizeVertical * 18,
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.sp)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: mSizeConfig.blockSizeVertical * 10.5,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6.sp),
                topRight: Radius.circular(6.sp),
              ),
            ),
          ),
          SizedBox(height: kDefaultMargin.sp,),
          Container(
            color: Colors.white,
            height: mSizeConfig.blockSizeVertical * 3,
          ),
          SizedBox(height: kDefaultMargin.sp-5.sp,),
          Container(
            color: Colors.white,
            height: mSizeConfig.blockSizeVertical * 3,
          ),
        ],
      ),
    );
  }
}

