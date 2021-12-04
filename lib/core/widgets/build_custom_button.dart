import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';

class BuildCustomButton extends StatelessWidget {
  final bool haveCorner;
  final  String title;
  final action;
  final disable;
  const BuildCustomButton({Key? key, required this.haveCorner, required this.action, required this.title, this.disable=false}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);

    return Material(
      borderRadius: BorderRadius.circular(6.sp),
      color: haveCorner?Colors.transparent:Theme.of(context).primaryColor,
      shadowColor: haveCorner?Colors.transparent:Colors.grey,
      child: InkWell(
        borderRadius:BorderRadius.circular(6.sp) ,
        splashColor: Colors.white.withOpacity(0.1),
        onTap: action,
        child: Container(
          width: double.infinity,
          height: mSizeConfig.blockSizeVertical*6,
          decoration: disable?BoxDecoration(
              borderRadius: BorderRadius.circular(6.sp),
              color: Colors.grey

          ):BoxDecoration(
            borderRadius: BorderRadius.circular(6.sp),
            border: Border.all(
              color: haveCorner?Theme.of(context).primaryColor:Colors.transparent,
              width: haveCorner?0.8:0.0
            )
          ),
          child: Center(
            child: Text(title,style: TextStyle(
                color: haveCorner?Theme.of(context).primaryColor:Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: kLargeFontSize13,
            ),),
          ),
        ),
      ),
    );
  }
}
