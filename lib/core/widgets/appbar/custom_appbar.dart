import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final double topPadding;
  final double horizontalMargin;
  final double verticalMargin;
  final SizeConfig mSizeConfig;

  const MyCustomAppBar(
      {required Key key,
      required this.height,
      required this.topPadding,
      required this.horizontalMargin,
      required this.verticalMargin,
      required this.mSizeConfig})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
             borderRadius: BorderRadius.circular(5.sp)
           ),
            margin: EdgeInsets.symmetric(
              vertical: verticalMargin,
              horizontal: horizontalMargin,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: mSizeConfig.blockSizeHorizontal*5,),
                SvgPicture.asset(
                  "assets/images/search.svg",
                  width: 16,
                  height: 16,
                  color: Colors.grey,
                ),
                SizedBox(width: mSizeConfig.blockSizeHorizontal*5,),
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
