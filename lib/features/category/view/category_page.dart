import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/constants/temp_data.dart';
import 'package:whole_snack/core/model/temp_model/temp_category_model.dart';
import 'package:whole_snack/core/model/temp_model/temp_item_model.dart';
import 'package:whole_snack/core/utils/generate_type_list_widgets.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/appbar/custom_appbar.dart';
import 'package:whole_snack/features/category/controller/category_controller.dart';
import 'package:whole_snack/features/home/controller/home_controller.dart';

import 'build_item_type_single_design.dart';
import 'build_single_category_design.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);

    HomeController mHomeController = Get.find<HomeController>();
    double appBarHeight = mSizeConfig.blockSizeVertical * 9;

    List<TempCategoryModel> mCategoryList = zRealCategoryData;
    List<TempCategoryModel> mTypeList = zTypeList;

    List<TempItemModel> mItemList = zItemData;

    return Scaffold(
      appBar: MyCustomAppBar(height: appBarHeight, key: _scaffoldKey),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return BuildSingleCategoryDesign(
                        image: mCategoryList[index].image,
                        title: mCategoryList[index].title,
                        index:index
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 0.6.sp,
                    );
                  },
                  itemCount: mCategoryList.length,
                ),
              )
            ),
            Expanded(
                flex: 9,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  margin: EdgeInsets.only(
                      top: kDefaultMargin.sp, left: kDefaultMargin.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        children: GenerateTypeList()
                            .generateTypeListWidget(mTypeList, mSizeConfig),
                      ),
                      SizedBox(
                        height: 8.sp,
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: ListView(
                            children: [
                              BuildItemTypeSingleDesign(
                                itemTypeTitle: 'PopCorns',
                                mSizeConfig: mSizeConfig,
                                mHomeController: mHomeController,
                                mItemList: mItemList,
                              ),
                              BuildItemTypeSingleDesign(
                                itemTypeTitle: 'Biscuits',
                                mSizeConfig: mSizeConfig,
                                mHomeController: mHomeController,
                                mItemList: mItemList,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
