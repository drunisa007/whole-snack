import 'package:flutter/material.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';

AppBar getAppBarWithBackArrow(String title,SizeConfig mConfig,action){
  return  AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(title,style: TextStyle(
        color: Colors.black,
        fontSize: KAppBarTitleFontSize,
    ),),
    leading: IconButton(
      onPressed:action,
      icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
    ),
  );
}