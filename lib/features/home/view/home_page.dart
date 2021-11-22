import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/appbar/build_horizontal_items.dart';
import 'package:whole_snack/core/widgets/appbar/custom_appbar.dart';
import 'package:whole_snack/features/home/controller/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whole_snack/features/home/view/build_banner_design.dart';
import 'package:whole_snack/features/home/view/build_horizontal_category.dart';



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);

    double height = mSizeConfig.blockSizeVertical*9;

    HomeController mHomeController = Get.find<HomeController>();


    return Scaffold(
        appBar: MyCustomAppBar(
            key: _scaffoldKey,
          height:height
           ),
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 8.sp,
            ),
            BuildBannerDesign(
              mHomeController: mHomeController,
              mSizeConfig: mSizeConfig,
            ),
            SizedBox(
              height: 8.sp,
            ),
            BuildHorizontalCategory(
              mSizeConfig: mSizeConfig,
              mHomeController: mHomeController,
            ),
            SizedBox(
              height: 8.sp,
            ),
            BuildHorizontalItems(
              title: "Best Sellers",
              haveSeeMore: true,
            ),
            SizedBox(
              height: 8.sp,
            ),
            BuildHorizontalItems(
              title: "Monthly Promotions",
              haveSeeMore: true,
            ),
            SizedBox(height: kDefaultMargin,)
          ],
          shrinkWrap: true,
        ));
  }
}
