import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';

class BuildSingleCategoryDesign extends StatelessWidget {
  final String image;
  final String title;

  const BuildSingleCategoryDesign(
      {Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig mSizeConfig = Get.find<SizeConfig>();

    return Container(
      width: double.infinity,
      height:mSizeConfig.blockSizeVertical * 8.3,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryVariant,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: mSizeConfig.blockSizeVertical * 2,
          ),
          SvgPicture.asset(
            "$image",
            width: mSizeConfig.blockSizeVertical * 3,
            height: mSizeConfig.blockSizeVertical * 3,
            fit: BoxFit.fill,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          SizedBox(
            height: 4.sp,
          ),
          Padding(
            padding: EdgeInsets.only(left: 0.5, right: 0.5),
            child: Text(
              "$title",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: kMediumFontSize12.sp,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
          )
        ],
      ),
    );
  }
}
