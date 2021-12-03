
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whole_snack/core/model/data_model/type_model.dart';
import 'package:whole_snack/core/model/temp_model/temp_category_model.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/category/view/build_type_design.dart';

class GenerateTypeList{
  List<Widget> generateTypeListWidget(mTypeList,SizeConfig mSizeConfig){

    List<Widget> mTypeWidgetList = [];

    int index=0;
    for(TypeModel mModel in mTypeList){
      mTypeWidgetList.add(BuildTypeDesign(mModel: mModel,index:index));
      index++;
    }


    return mTypeWidgetList;
  }
}