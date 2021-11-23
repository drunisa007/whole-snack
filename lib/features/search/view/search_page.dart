import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/constants/temp_data.dart';
import 'package:whole_snack/core/model/temp_model/temp_addtocart_model.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/appbar/custom_search_appbar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);

    double height = mSizeConfig.blockSizeVertical * 9;

    List<TempAddToCartModel> mSearchList = zAddToCartList;

    return Scaffold(
      appBar: CustomSearchAppBar(key: _scaffoldKey, height: height),
      body: Container(
        margin:
            EdgeInsets.only(left: kDefaultMargin.sp, right: kDefaultMargin.sp),
        child: ListView.builder(
          itemBuilder: (context, index) {
            TempAddToCartModel mModel = mSearchList[index];

            return Card(
              margin: EdgeInsets.only(top: kDefaultMargin.sp),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.sp)),
              child: Container(
                height: mSizeConfig.safeBlockVertical * 10,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2.sp),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          child: CachedNetworkImage(
                            imageUrl: "${mModel.image}",
                            fit: BoxFit.contain,
                            placeholder: (context, url) => Image.asset(
                              "assets/images/place_holder.png",
                              fit: BoxFit.contain,
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                              "assets/images/place_holder.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 4,
                        child: Container(
                          padding: EdgeInsets.only(left: kDefaultMargin.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                mModel.title,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: kLargeFontSize14,
                                    letterSpacing: 0.4,
                                    fontWeight: FontWeight.w800),
                              ),
                              Text(
                                mModel.originalPrice,
                                style: TextStyle(
                                    fontSize: kSmallFontSize10,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          child: Container(
                            margin: EdgeInsets.only(
                              top: kDefaultMargin.sp,
                              right: kDefaultMargin.sp,
                              bottom: kDefaultMargin.sp,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(4.sp),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(mModel.itemPackage.quantity,style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: kMediumFontSize12
                                ),),
                                Text(mModel.itemPackage.price,style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: kMediumFontSize12
                                ),)
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            );
          },
          itemCount: mSearchList.length,
          shrinkWrap: true,
        ),
      ),
    );
  }
}
