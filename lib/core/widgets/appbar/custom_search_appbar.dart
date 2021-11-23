import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';

class CustomSearchAppBar extends StatelessWidget implements PreferredSizeWidget {


  final double height;

  const CustomSearchAppBar(
      {required Key key, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);

    double topPadding = mSizeConfig.topPadding;
    double horizontalMargin = mSizeConfig.blockSizeHorizontal * 5;
    double verticalMargin = mSizeConfig.blockSizeVertical * 1.45;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryVariant,
                borderRadius: BorderRadius.circular(5.sp)),
            margin: EdgeInsets.symmetric(
              vertical: verticalMargin,
              horizontal: horizontalMargin,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: mSizeConfig.blockSizeHorizontal * 5,
                ),
                SvgPicture.asset(
                  "assets/images/search.svg",
                  width: 16,
                  height: 16,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: mSizeConfig.blockSizeHorizontal * 5,
                ),
                Text(
                  "Find Products Or Category Here",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: kMediumFontSize12.sp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
