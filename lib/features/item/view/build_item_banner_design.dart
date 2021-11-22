import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/temp_data.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/item/controller/item_controller.dart';


class BuildItemBannerDesign extends StatelessWidget {
  const BuildItemBannerDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarouselController buttonCarouselController = CarouselController();

    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);


    ItemController mItemController = Get.find<ItemController>();

    List<String> mTempImages = zItemBannerImages;


    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: CarouselSlider(
            options: CarouselOptions(
              height: mSizeConfig.safeBlockVertical * 30,
              initialPage: 0,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                mItemController.changeBannerCurrentIndex(index.toDouble());
              },
              scrollDirection: Axis.horizontal,
              reverse: false,
              enableInfiniteScroll: true,
            ),
            carouselController: buttonCarouselController,
            items: [1,2,3].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    child: CachedNetworkImage(
                      imageUrl: mTempImages[i - 1],
                      placeholder: (context, url) => Image.asset(
                        "assets/images/place_holder.png",
                        fit: BoxFit.fill,
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        "assets/images/place_holder.png",
                        fit: BoxFit.fill,
                      ),
                      fit: BoxFit.fill,
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.only(top: 30.sp, left: 10.sp),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                color: Colors.grey.withOpacity(0.5),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Obx(() {
                return DotsIndicator(
                  dotsCount: mTempImages.length,
                  position: mItemController.bannerIndex.value,
                  decorator: DotsDecorator(
                    color: Theme.of(context).primaryColor.withOpacity(0.5), // Inactive color
                    activeColor: Theme.of(context).primaryColor,
                    size: Size.square(7.0.sp),
                    activeSize:Size(30.0.sp, 7.0.sp),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
