import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/features/cart/controller/cart_controller.dart';
import 'package:whole_snack/features/feature_main/controller/feature_main_controller.dart';

class SimpleCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const SimpleCustomAppBar(
      {Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {


    CartController mCartController = Get.find<CartController>();
    FeatureMainController mFeatureController = Get.find<FeatureMainController>();

    return Obx((){
      return AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: KAppBarTitleFontSize.sp,
            ),
          ),
          backgroundColor: Colors.white,
          leading: mCartController.cartAppBarBackArrow.isTrue
              ? IconButton(
            onPressed: (){
              mCartController.cartAppBarBackArrow.value = false;
              mFeatureController.mRouteHistory.removeLast();

              if(mFeatureController.startRoute.value=="home"){
                mFeatureController.changeIndex(0);
              }
              else if(mFeatureController.startRoute.value == "category"){
                mFeatureController.changeIndex(1);
              }
              else{
                mFeatureController.changeIndex(2);
              }
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          )
              : Container());
    });
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}