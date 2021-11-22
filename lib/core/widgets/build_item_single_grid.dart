import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/temp_model/temp_item_package_model.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/home/controller/home_controller.dart';

class BuildItemSingleGrid extends StatelessWidget {
  final int currentIndex;
  final SizeConfig mSizeConfig;
  final HomeController mHomeController;
  final String image;
  final String title;
  final String originalPrice;
  final TempItemPackageModel firstPackages;

  const BuildItemSingleGrid(
      {Key? key,
      required this.currentIndex,
      required this.mSizeConfig,
      required this.mHomeController,
      required this.image,
      required this.title,
      required this.originalPrice,
      required this.firstPackages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.sp)),
      color: Colors.white,
      elevation: 1,
      child: Container(
        height: mSizeConfig.blockSizeVertical * 22,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(6.sp)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height:mSizeConfig.blockSizeVertical * 8,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6.sp),
                  topRight: Radius.circular(6.sp),
                ),
              ),
              child: CachedNetworkImage(
                fit: BoxFit.contain,
                imageUrl: image,
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
                        fontSize: kMediumFontSize12.sp),
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
    );
  }
}
