import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/data_model/type_model.dart';
import 'package:whole_snack/core/model/temp_model/temp_category_model.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/category/controller/category_controller.dart';

class BuildTypeDesign extends StatelessWidget {
  final TypeModel mModel;
  final int index;

  const BuildTypeDesign({Key? key, required this.mModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig mSizeConfig = Get.find<SizeConfig>();

    CategoryController mCategoryController = Get.find<CategoryController>();

    return Obx(() {
      return GestureDetector(
        onTap: () {
          if (mCategoryController.selectedPrevent.isFalse) {
            mCategoryController.changeTypeIndex(index);
          }
        },
        child: Container(
          width: mSizeConfig.blockSizeVertical * 7.5,
          margin: EdgeInsets.only(bottom: 4.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: Container(
                  height: mSizeConfig.blockSizeVertical * 5,
                  width: mSizeConfig.blockSizeVertical * 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.sp),
                    color: Colors.white,
                    border: Border.all(
                        color:
                            mCategoryController.selectedTypeIndex.value == index
                                ? Theme.of(context).primaryColor
                                : Colors.transparent,
                        width:
                            mCategoryController.selectedTypeIndex.value == index
                                ? 0.4
                                : 0.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.sp),
                    child: Padding(
                      padding: EdgeInsets.all(3.sp),
                      child: CachedNetworkImage(
                        imageUrl: "${mModel.typeImg}",
                        fit: BoxFit.contain,
                        placeholder: (context, url) => Image.asset(
                          "assets/images/place_holder.png",
                          fit: BoxFit.fill,
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          "assets/images/place_holder.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 3.sp,
              ),
              Text(
                mModel.typeName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondaryVariant,
                  fontSize: kSmallFontSize10,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
