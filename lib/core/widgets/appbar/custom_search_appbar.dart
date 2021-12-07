import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';

class CustomSearchAppBar extends StatelessWidget implements PreferredSizeWidget {


  final double height;
   final bool haveBackButton ;

   const CustomSearchAppBar(
      {required Key key, required this.height, required this.haveBackButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);

    double topPadding = mSizeConfig.topPadding;
    double horizontalMargin = mSizeConfig.blockSizeHorizontal * 5;
    double verticalMargin = mSizeConfig.blockSizeVertical * 1.45;

    TextEditingController mTextEditingController = TextEditingController();


    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: Center(
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios_new,color: Colors.grey,), onPressed: () {
                  Get.back();
              },
              ),
              Expanded(
                child: Container(
                  height: mSizeConfig.safeBlockVertical*20,
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
                      Container(
                        width: mSizeConfig.blockSizeHorizontal * 40,
                        child: TextField(
                          controller: mTextEditingController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter Your Name'
                          ),
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: kMediumFontSize12.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
