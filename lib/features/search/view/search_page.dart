import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/data_model/item_model.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/search/controller/search_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);

    double height = mSizeConfig.blockSizeVertical * 9;

    SearchController mSearchController = Get.find<SearchController>();

    double topPadding = mSizeConfig.topPadding;
    double horizontalMargin = mSizeConfig.blockSizeHorizontal * 5;
    double verticalMargin = mSizeConfig.blockSizeVertical * 1.45;

    TextEditingController mTextEditingController = TextEditingController();

    mTextEditingController.addListener(() async {
      if (mTextEditingController.text.length > 0) {
        mSearchController.filterList(mTextEditingController.text.trim());
      } else {
        mSearchController.emptyFilterList();
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.only(top: topPadding),
            child: Center(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  Expanded(
                    child: Container(
                      height: mSizeConfig.safeBlockVertical * 20,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryVariant,
                          borderRadius: BorderRadius.circular(5.sp)),
                      margin: EdgeInsets.symmetric(
                        vertical: verticalMargin,
                        horizontal: horizontalMargin,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: mSizeConfig.blockSizeHorizontal * 5,
                          ),
                          SvgPicture.asset(
                            "assets/images/search.svg",
                            width: 16,
                            height: 16,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: mSizeConfig.blockSizeHorizontal * 5,
                          ),
                          Container(
                            width: mSizeConfig.blockSizeHorizontal * 40,
                            child: TextField(
                              controller: mTextEditingController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter Your Name'),
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontSize: kMediumFontSize12.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Obx(() {
        return mSearchController.loading.isTrue
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (context, index) {
                  ItemModel mModel = mSearchController.mFilterList[index];
                  return Material(
                    elevation: 1,
                    shape: RoundedRectangleBorder(

                    ),
                    child: InkWell(
                     borderRadius: BorderRadius.circular(2.sp),
                      onTap: (){

                      },
                      child: Container(
                        height: mSizeConfig.safeBlockVertical * 10,
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: kDefaultMargin.sp-4.sp,left: kDefaultMargin.sp,
                            right: kDefaultMargin.sp,
                            top: kDefaultMargin.sp-4.sp),
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
                                    imageUrl: "${mModel.img}",
                                    fit: BoxFit.contain,
                                    placeholder: (context, url) => Image.asset(
                                      "assets/images/place_holder.png",
                                      fit: BoxFit.contain,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
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
                                      Container(
                                        height: mSizeConfig.safeBlockVertical * 5.4,
                                        child: Text(
                                          mModel.itemName,
                                          textScaleFactor: 0.85,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: kMediumFontSize12.sp,
                                              letterSpacing: 0.3,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Text(
                                        "${mModel.price} Ks",
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: kSmallFontSize9.sp,
                                        ),
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
                                        Text(
                                          mModel.packageName,
                                          textScaleFactor: 0.85,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: kMediumFontSize11),
                                        ),
                                        Text(
                                          "${mModel.price} Ks",
                                          textScaleFactor: 0.85,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: kMediumFontSize11),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: mSearchController.mFilterList.length,
                shrinkWrap: true,
              );
      }),
    );
  }
}
