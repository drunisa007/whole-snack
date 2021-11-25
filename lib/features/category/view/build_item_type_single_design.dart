import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/temp_model/temp_item_model.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/build_item_single_grid.dart';
import 'package:whole_snack/features/home/controller/home_controller.dart';

class BuildItemTypeSingleDesign extends StatelessWidget {
  final String itemTypeTitle;
  final List<TempItemModel> mItemList;
  final SizeConfig mSizeConfig;
  final HomeController mHomeController;

  const BuildItemTypeSingleDesign({
    Key? key,
    required this.itemTypeTitle,
    required this.mItemList,
    required this.mSizeConfig,
    required this.mHomeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 3.sp),
              child: Text(
                "$itemTypeTitle",
                style: TextStyle(
                    fontSize: kMediumFontSize12.sp, fontWeight: FontWeight.w600),
              ),
            ),
            Spacer(),
            IconButton(
                onPressed: () {},
                iconSize: 20.sp,
                icon: Icon(
                  Icons.expand_less_outlined,
                  color: Colors.black,
                )),
            SizedBox(
              width: kDefaultMargin,
            )
          ],
        ),
        SizedBox(
          height: 4.sp,
        ),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1 / 1.24),
          itemCount: mItemList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return BuildItemSingleGrid(
                currentIndex: index,
                mSizeConfig: mSizeConfig,
                mHomeController: mHomeController,
                image: mItemList[index].image,
                title: mItemList[index].title,
                originalPrice: mItemList[index].originalPrice,
                firstPackages: mItemList[index].packages[0]);
          },
        )
      ],
    );
  }
}
