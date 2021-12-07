import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/data_model/item_model.dart';
import 'package:whole_snack/core/model/temp_model/temp_item_package_model.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/home/controller/home_controller.dart';

class BuildItemSingle extends StatelessWidget {
  final int currentIndex;
  final int mainIndex;

  const BuildItemSingle({
    Key? key,
    required this.currentIndex,
    required this.mainIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig mSizeConfig = Get.find<SizeConfig>();

    HomeController mHomeController = Get.find<HomeController>();

    ItemModel mModel =
        mHomeController.mCategoryItemList[mainIndex].mItemList[currentIndex];

    return GestureDetector(
      onTap: () {
        Get.toNamed("/item-page", arguments: [
          mModel.itemId,
          mHomeController.mCategoryItemList[mainIndex].title,
          mModel.itemName
        ]);
      },
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.sp)),
        margin: EdgeInsets.only(
          right: mHomeController.mCategoryItemList[mainIndex].mItemList.length -
                      1 ==
                  currentIndex
              ? 0
              : kDefaultMargin + 4.sp,
        ),
        color: Colors.white,
        elevation: 1,
        child: Container(
          width: mSizeConfig.blockSizeVertical * 19,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(6.sp)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: mSizeConfig.blockSizeVertical * 10.5,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6.sp),
                    topRight: Radius.circular(6.sp),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: mModel.img,
                    placeholder: (context, url) => Image.asset(
                      "assets/images/place_holder.png",
                      fit: BoxFit.cover,
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      "assets/images/place_holder.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: double.infinity,
                  margin: EdgeInsets.only(left: 8.sp),
                  child: Text(
                    mModel.itemName,
                    maxLines: 2,
                    textScaleFactor: 0.85,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: kMediumFontSize12.sp),
                  ),
                ),
              ),
              Container(
                  width: double.infinity,
                  height: mSizeConfig.blockSizeVertical * 3.5,
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
                        mModel.packageName,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: mModel.packageName.length > 10
                                ? kSmallFontSize10
                                : kLargeFontSize13.sp),
                      ),
                      Spacer(),
                      Text(
                        "Ks ${mModel.price}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: kLargeFontSize13.sp),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
