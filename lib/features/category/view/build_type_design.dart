import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/temp_model/temp_category_model.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/category/controller/category_controller.dart';

class BuildTypeDesign extends StatelessWidget {

  final TempCategoryModel mModel;
  final int index;

  const BuildTypeDesign({Key? key, required this.mModel, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig mSizeConfig = Get.find<SizeConfig>();

    CategoryController mCategoryController = Get.find<CategoryController>();

    return Obx((){
      return GestureDetector(
        onTap: (){
          mCategoryController.changeTypeIndex(index);
        },
        child: Container(
          margin: EdgeInsets.only(right: 6.sp,bottom: 4.sp),
          child: Column(
            children: [
              Card(
                elevation: 1,
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.sp)),
                child: Container(
                  height: mSizeConfig.blockSizeVertical * 5.sp,
                  width: mSizeConfig.blockSizeVertical * 5.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.sp),
                    color: Colors.white,
                    border: Border.all(color: mCategoryController.selectedTypeIndex.value==index?Theme.of(context).primaryColor:Colors.transparent, width: mCategoryController.selectedTypeIndex.value==index?0.4:0.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.sp),
                    child: CachedNetworkImage(
                      imageUrl: "${mModel.image}",
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
              SizedBox(height: 4.sp,),
              Text(mModel.title,style: TextStyle(
                  color: Colors.black,
                  fontSize: kMediumFontSize12
              ),),
              SizedBox(height: 4.sp,),
            ],
          ),
        ),
      );
    });
  }
}
