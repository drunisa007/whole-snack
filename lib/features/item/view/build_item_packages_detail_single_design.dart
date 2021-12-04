import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/data_model/item_detail_noimage_model.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/item/controller/item_controller.dart';

class BuildItemPackagesDetailSingleDesign extends StatelessWidget {
  final int index;
  const BuildItemPackagesDetailSingleDesign({
    Key? key,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);

    ItemController mItemController = Get.find<ItemController>();
    ItemDetailNoImageModel mModel = mItemController.mItemDetailNoImage[index];

    return GestureDetector(
      onTap: () {
        if(int.parse(mModel.instock.trim())>1){
          mItemController.changeItemSelectedIndex(index);
        }
        else{
          Get.snackbar("Out Of Stock", "Sorry for inconvenience");
        }

      },
      child: Obx((){
        return  Container(
          width: double.infinity,
          height: mSizeConfig.safeBlockVertical * 6,
          margin: EdgeInsets.only(bottom: kDefaultMargin.sp),
          decoration: BoxDecoration(
              color: mItemController.itemSelectedIndex.value==index
                  ? Colors.white
                  : Theme.of(context).colorScheme.primaryVariant,
              border: mItemController.itemSelectedIndex.value==index
                  ? Border.all(color: Theme.of(context).primaryColor, width: 0.7)
                  : Border.all(width: 0.0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.sp)),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(left: kDefaultMargin.sp),
                  child:
                      Row(
                        children: [
                          int.parse(mModel.instock.trim())<0?Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4.5.sp, horizontal: 8.sp),
                            margin: EdgeInsets.only(right: kDefaultMargin.sp),
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(2.sp)),
                            child: Text(
                              "Out Of Stock",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: (kSmallFontSize9).sp),
                            ),
                          ): Container(),
                          Text(
                            "${mModel.packageName}",
                            style: TextStyle(
                              color:  mItemController.itemSelectedIndex.value==index
                                  ? Theme.of(context).primaryColor
                                  : Colors.black,
                              fontSize: kLargeFontSize13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 4.5.sp, horizontal: 8.sp),
                          decoration: BoxDecoration(
                              color:  mItemController.itemSelectedIndex.value==index
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).colorScheme.onPrimary,
                              borderRadius: BorderRadius.circular(2.sp)),
                          child: Text(
                            "Save - K 100",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: (kSmallFontSize9).sp),
                          ),
                        ),
                        Text("Ks ${mModel.price}",
                            style: TextStyle(
                                color:  mItemController.itemSelectedIndex.value==index
                                    ? Theme.of(context).primaryColor
                                    : Colors.black,
                                fontSize: kLargeFontSize13.sp))
                      ],
                    ),
                  ))
            ],
          ),
        );
      }),
    );
  }
}
