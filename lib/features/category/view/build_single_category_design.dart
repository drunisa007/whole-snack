import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/get_category_image.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/cart/controller/cart_controller.dart';
import 'package:whole_snack/features/category/controller/category_controller.dart';
import 'package:whole_snack/features/home/controller/home_controller.dart';

class BuildSingleCategoryDesign extends StatelessWidget {
  final String image;
  final String title;
  final int index;
  final String id;
  final HomeController mHomeController;

  const BuildSingleCategoryDesign(
      {Key? key,
      required this.image,
      required this.title,
      required this.index,
      required this.id, required this.mHomeController,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig mSizeConfig = Get.find<SizeConfig>();

    CategoryController mCategoryController = Get.find<CategoryController>();

    //String iconName = getCategoryImage(title);

    return Obx((){
      return GestureDetector(
        onTap: () {
          if(mCategoryController.selectedPrevent.isFalse){
            mCategoryController.changeCategoryIndex(index,id);
          }

        },
        child: Container(
          width: double.infinity,
          height: mSizeConfig.blockSizeVertical * 9,
          decoration: BoxDecoration(
            color: mCategoryController.selectedCategoryIndex.value == index
                ? Theme.of(context).primaryColor
                : Theme.of(context).colorScheme.primaryVariant,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: mSizeConfig.blockSizeVertical * 1.5,
              ),
              Container(
                width: mSizeConfig.blockSizeVertical * 2.8,
                height: mSizeConfig.blockSizeVertical * 2.8,
                child: ClipRRect(
                  child: CachedNetworkImage(
                    imageUrl: image,
                    placeholder: (context, url) => Image.asset(
                      "assets/images/place_holder.jpeg",
                      fit: BoxFit.cover,
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      "assets/images/place_holder.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // SvgPicture.asset(
              //   iconName,
              //   width: mSizeConfig.blockSizeVertical * 2.8,
              //   height: mSizeConfig.blockSizeVertical * 2.8,
              //   fit: BoxFit.fill,
              //   color: mCategoryController.selectedCategoryIndex.value == index
              //       ? Colors.white
              //       : Theme.of(context).colorScheme.secondaryVariant,
              // ),
              SizedBox(
                height: 4.sp,
              ),
              Padding(
                padding: EdgeInsets.only(left: 0.5, right: 0.5),
                child: Text(
                  "$title",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: kMediumFontSize12.sp-1.sp,
                      letterSpacing: 0.3,
                      color: mCategoryController.selectedCategoryIndex.value ==
                          index
                          ? Colors.white
                          : Theme.of(context).colorScheme.secondaryVariant),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
