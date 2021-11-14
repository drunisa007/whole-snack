import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';

AppBar getSimpleAppbar(String title,SizeConfig mConfig){
  return AppBar(
    centerTitle: true,
    title: Text(title,
      style: TextStyle(
        color: Colors.black,
        fontSize: KAppBarTitleFontSize.sp,
      ),
    ),
    backgroundColor: Colors.white,
  );
}