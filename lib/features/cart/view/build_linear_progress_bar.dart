import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'dart:math' as math;

class BuildLinearProgressBar extends StatelessWidget {
  final double realWidth;
  final double realSizeBoxWidth;

  const BuildLinearProgressBar({Key? key, required this.realWidth, required this.realSizeBoxWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children:[
            SizedBox(width:mSizeConfig.safeBlockHorizontal*realSizeBoxWidth,),
          Container(
            width: mSizeConfig.safeBlockHorizontal*15,
            height: mSizeConfig.safeBlockVertical*2.8,
            child: Stack(
              children: [
                Positioned.fill(child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Transform.rotate(
                    angle: - math.pi / 4,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 3.sp),
                      color: Theme.of(context).primaryColor,
                      width: 15.sp,
                      height: 15.sp,
                    ),
                  ),
                )),
                Container(
                  width: mSizeConfig.safeBlockHorizontal*15,
                  height: mSizeConfig.safeBlockVertical*2.2,
                  color: Theme.of(context).primaryColor,
                  child: Center(
                    child: Text("Ks. 1,000",style: TextStyle(
                      color: Colors.white,
                      fontSize: kSmallFontSize10,
                    ),),
                  ),
                ),

              ],
            ),
          )
          ]
        ),
        SizedBox(
          height: 4.sp,
        ),
        Container(
          width: double.infinity,
          height: mSizeConfig.blockSizeVertical * 1.8,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryVariant,
              borderRadius: BorderRadius.circular(10.sp)),
          child: Stack(
            children: [
              Container(
                width: mSizeConfig.safeBlockHorizontal * realWidth,
                height: mSizeConfig.blockSizeVertical * 1.8,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10.sp)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 2.sp,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2.sp),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Ks. 0",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: kMediumFontSize12),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Ks. 3,000",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: kMediumFontSize12),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Ks. 5,000",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: kMediumFontSize12),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Free",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: kMediumFontSize12),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
