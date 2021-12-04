import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:whole_snack/core/utils/size_config.dart';

class BuildTypeDesignShimmer extends StatelessWidget {
  const BuildTypeDesignShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);

    return Container(
      width: mSizeConfig.blockSizeVertical * 7.5,
      margin: EdgeInsets.only(bottom: 4.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            child: Container(
              height: mSizeConfig.blockSizeVertical * 5,
              width: mSizeConfig.blockSizeVertical * 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.sp),
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 3.sp,
          ),
          Container(
            width: mSizeConfig.blockSizeVertical * 6,
            height: mSizeConfig.blockSizeVertical * 1.2,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
