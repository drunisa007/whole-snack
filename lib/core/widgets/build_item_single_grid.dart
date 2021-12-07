import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/data_model/item_model.dart';
import 'package:whole_snack/core/model/temp_model/temp_item_package_model.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/category/controller/category_controller.dart';
import 'package:whole_snack/features/feature_main/controller/feature_main_controller.dart';
import 'package:whole_snack/features/home/controller/home_controller.dart';

class BuildItemSingleGrid extends StatelessWidget {
  final int currentIndex;

  const BuildItemSingleGrid(
      {Key? key,
      required this.currentIndex,
})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);

    CategoryController mCategoryController = Get.find<CategoryController>();

    ItemModel mItemModel = mCategoryController.mItemList[currentIndex];

    FeatureMainController mFeatureMainController = Get.find<FeatureMainController>();


    return Padding(
      padding: EdgeInsets.only(right: kDefaultMargin.sp,bottom: kDefaultMargin.sp),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.sp),
        ),
        shadowColor: Colors.grey,
        child: InkWell(
          borderRadius: BorderRadius.circular(6.sp),
          splashColor: Colors.grey,
          onTap: () {
            mFeatureMainController.pushNewRoutesHistory();
            mFeatureMainController.startRoute.value="category";
            Get.toNamed("/item-page",arguments: [mItemModel.itemId,mItemModel.categoryName,mItemModel.itemName]);
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(6.sp)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: mSizeConfig.blockSizeVertical * 10,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6.sp),
                      topRight: Radius.circular(6.sp),
                    ),
                  ),
                  child: CachedNetworkImage(
                    fit: BoxFit.contain,
                    imageUrl: mItemModel.img,
                    placeholder: (context, url) => Image.asset(
                      "assets/images/place_holder.jpeg",
                      fit: BoxFit.fill,
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      "assets/images/place_holder.jpeg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mItemModel.itemName,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: kMediumFontSize12.sp - 1.sp),
                      ),
                      Text(
                        mItemModel.price,
                        style: TextStyle(
                            fontSize: kSmallFontSize10.sp - 1.sp,
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                    width: double.infinity,
                    height: mSizeConfig.blockSizeVertical * 3,
                    padding: EdgeInsets.symmetric(horizontal: 8.sp),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(6.sp),
                          bottomRight: Radius.circular(6.sp),
                        )),
                    child: Row(
                      children: [
                        Text(
                          mItemModel.packageName,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: mItemModel.packageName.length > 10
                                  ? kSmallFontSize9:kMediumFontSize11.sp),
                        ),
                        Spacer(),
                        Text(
                          "${mItemModel.price} Ks",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: kMediumFontSize11.sp),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
