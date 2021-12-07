
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/constants/temp_data.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/home/controller/home_controller.dart';
class BuildBannerDesign extends StatelessWidget {

  final SizeConfig mSizeConfig;
  final HomeController mHomeController;

   BuildBannerDesign({Key? key,required this.mSizeConfig,required this.mHomeController}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<String> mTempImages = zBannerImages;

    CarouselController buttonCarouselController = CarouselController();

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height:mSizeConfig.blockSizeVertical*18.5,
            initialPage: 0,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              mHomeController.changeBannerCurrentIndex(index.toDouble());
            },
            scrollDirection: Axis.horizontal,
            reverse: false,
            autoPlayInterval: Duration(seconds: 5),
            autoPlay: true,
            pauseAutoPlayOnTouch: true,
            enableInfiniteScroll: true,
          ),
          carouselController: buttonCarouselController,
          items: [1, 2, 3].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Card(
                  margin: EdgeInsets.only(left: kDefaultMargin,right: kDefaultMargin),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.sp)
                  ),
                  child: Container(
                    width: double.infinity,
                    height: mSizeConfig.blockSizeVertical*18.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp)
                    ),
                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(5.sp),
                      child: CachedNetworkImage(
                        imageUrl: "${mTempImages[i-1]}",
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Image.asset(
                          "assets/images/place_holder.jpeg",
                          fit: BoxFit.cover,
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          "assets/images/place_holder.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(
          height: 8.sp,
        ),
        Obx((){
          return DotsIndicator(
            dotsCount: mTempImages.length,
            position: mHomeController.bannerIndex.value,
            decorator: DotsDecorator(
              color: Theme.of(context).primaryColor.withOpacity(0.5), // Inactive color
              activeColor: Theme.of(context).primaryColor,
              size: Size.square(7.0.sp),
              activeSize:Size(30.0.sp, 7.0.sp),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0.sp)),
            ),
          );
        }),
      ],
    );
  }
}
