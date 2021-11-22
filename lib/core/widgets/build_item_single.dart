import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/temp_model/temp_item_package_model.dart';
import 'package:whole_snack/core/utils/size_config.dart';

class BuildItemSingle extends StatelessWidget {
  final int currentIndex;
  final SizeConfig mSizeConfig;
  final String image;
  final String title;
  final String originalPrice;
  final TempItemPackageModel firstPackages;

  const BuildItemSingle(
      {Key? key,
      required this.currentIndex,
      required this.mSizeConfig,
      required this.image,
      required this.title,
      required this.originalPrice,
      required this.firstPackages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: (){
        Get.toNamed("/item-page");
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.sp)),
        margin: EdgeInsets.only(right: kDefaultMargin+4),
        color: Colors.white,
        elevation: 1,
        child: Container(
          height: mSizeConfig.blockSizeVertical * 21.5,
          width: mSizeConfig.blockSizeVertical * 17,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(6.sp)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6.sp),
                  topRight: Radius.circular(6.sp),
                ),
                child: CachedNetworkImage(
                  height: mSizeConfig.blockSizeVertical * 10,
                  width: mSizeConfig.blockSizeVertical * 16,
                  imageUrl: image,
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
              Container(
                margin: EdgeInsets.only(left: 8.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: kLargeFontSize14.sp),
                    ),
                    Text(
                      originalPrice,
                      style: TextStyle(fontSize: kSmallFontSize10.sp),
                    ),
                  ],
                ),
              ),
              Spacer(),
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
                      firstPackages.quantity,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kLargeFontSize14.sp),
                    ),
                    Spacer(),
                    Text("Ks ${firstPackages.price}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kLargeFontSize14.sp),
                    ),
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
