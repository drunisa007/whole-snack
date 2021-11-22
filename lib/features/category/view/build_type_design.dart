import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/temp_model/temp_category_model.dart';
import 'package:whole_snack/core/utils/size_config.dart';

class BuildTypeDesign extends StatelessWidget {

  final TempCategoryModel mModel;

  const BuildTypeDesign({Key? key, required this.mModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig mSizeConfig = Get.find<SizeConfig>();

    return Container(
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
                // border:
                //     Border.all(color: Theme.of(context).primaryColor, width: 0.4),
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
    );
  }
}
