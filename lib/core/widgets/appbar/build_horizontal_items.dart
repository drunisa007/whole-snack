import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/constants/temp_data.dart';
import 'package:whole_snack/core/model/temp_model/temp_item_model.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/build_item_single.dart';
class BuildHorizontalItems extends StatelessWidget {

  final String title;
  final bool  haveSeeMore;
  BuildHorizontalItems(
      {Key? key,required this.title, required this.haveSeeMore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TempItemModel> mItemList = zItemData;

    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);

    return Container(
      margin: EdgeInsets.only(left: kDefaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: kDefaultMargin),
            child: Row(
              children: [
                Text(
                  "$title",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: kLargeFontSize14.sp),
                ),
                Spacer(),
                haveSeeMore? TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      primary: Theme.of(context).primaryColor),
                  child: Text(
                    "See More",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: kSmallFontSize10.sp),
                  ),
                ): Container()
              ],
            ),
          ),
          SizedBox(
            height: 6.sp,
          ),
          Container(
            height: mSizeConfig.blockSizeVertical * 21.5,
            child: ListView.builder(itemBuilder: (context, index) {
              return BuildItemSingle(
                mSizeConfig: mSizeConfig,
                 currentIndex: index,
                title: mItemList[index].title,
                image: mItemList[index].image,
                originalPrice: mItemList[index].originalPrice,
                firstPackages: mItemList[index].packages[0],
              );
            },
              itemCount: mItemList.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
            ),
          )
        ],
      ),
    );
  }
}