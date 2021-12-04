import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/data_model/item_detail_noimage_model.dart';
import 'package:whole_snack/core/model/temp_model/temp_addtocart_model.dart';
import 'package:whole_snack/core/model/temp_model/temp_item_package_model.dart';
import 'package:whole_snack/core/widgets/appbar/build_horizontal_items.dart';
import 'package:whole_snack/core/widgets/build_custom_button.dart';
import 'package:whole_snack/features/cart/controller/cart_controller.dart';
import 'package:whole_snack/features/feature_main/controller/feature_main_controller.dart';
import 'package:whole_snack/features/item/controller/item_controller.dart';

import 'build_item_banner_design.dart';
import 'build_item_packages_detail.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    CartController mCartController = Get.find<CartController>();
    FeatureMainController mFeatureController = Get.find<FeatureMainController>();

    ItemController mItemController = Get.find<ItemController>();

    String itemId = Get.arguments[0];
    String categoryName = Get.arguments[1];
    String itemName = Get.arguments[2];

    mItemController.fetchItemDetail(itemId);


    return Scaffold(
      body: Container(
        child: Obx((){
          return mItemController.showLoading.isTrue&&mItemController.mItemDetailImages.isEmpty?Center(
            child: GetPlatform.isAndroid?CircularProgressIndicator():CupertinoActivityIndicator(),
          ):
          Stack(
            children: [
              Column(
                children: [
                  BuildItemBannerDesign(),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        children: [
                          SizedBox(
                            height: kDefaultMargin.sp,
                          ),
                          Container(
                            width: double.infinity,
                            color: Colors.white,
                            padding: EdgeInsets.only(
                                left: kDefaultMargin.sp,
                                right: kDefaultMargin.sp,
                                top: kDefaultMargin.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: kDefaultMargin.sp,
                                ),
                                Text(
                                  "$itemName",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: kExtraLargeFontSize15.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 4.sp,
                                ),
                                Text(
                                  "$categoryName",
                                  style: TextStyle(fontSize: kMediumFontSize11.sp,
                                      color: Theme.of(context).colorScheme.onSecondary
                                  ),
                                ),
                                SizedBox(
                                  height: kDefaultMargin.sp + 10.sp,
                                ),
                                BuildItemPackagesDetail(),
                                SizedBox(
                                  height: kDefaultMargin.sp + 10.sp,
                                ),
                                BuildCustomButton(
                                  action: () {
                               if( mItemController.itemSelectedIndex.value>=0){

                                 ItemDetailNoImageModel mModel = mItemController.mItemDetailNoImage[mItemController.itemSelectedIndex.value];

                                 mCartController.addNewCart(
                                     TempAddToCartModel(
                                       mItemController.mItemDetailImages[0],
                                       mModel.itemName,
                                       "${mModel.packageName} - ${mModel.price} Ks",
                                       TempItemPackageModel("${mModel.itemQty}", "${mModel.price}"),
                                       1,
                                     ));
                                 mItemController.changeItemSelectedIndex(-1);

                              }
                                  },
                                  disable: mItemController.itemSelectedIndex.value>=0?false:true,
                                  haveCorner: false,
                                  title: "Add to Cart",
                                ),
                                SizedBox(
                                  height: kDefaultMargin.sp + 10.sp,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: kDefaultMargin.sp,
                          ),
                          BuildHorizontalItems(
                            title: "Similar Items",
                            haveSeeMore: false,
                          ),
                          SizedBox(
                            height: GetPlatform.isIOS
                                ? kBottomNavigationBarHeight + MediaQuery.of(context).padding.bottom+kDefaultMargin.sp
                                : kBottomNavigationBarHeight + kDefaultMargin,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: (){
                      mFeatureController.changeIndex(2);
                      mCartController.cartAppBarBackArrow.value = true;
                      Get.toNamed("/");
                    },
                    child: Container(
                      width: double.infinity,
                      color: Theme.of(context).primaryColor,
                      height: GetPlatform.isIOS
                          ? kBottomNavigationBarHeight +MediaQuery.of(context).padding.bottom
                          : kBottomNavigationBarHeight,
                      padding: EdgeInsets.only(
                          left: kDefaultMargin + kDefaultMargin,
                          right: kDefaultMargin + kDefaultMargin),
                      child: Center(
                        child: Row(
                          children: [
                            Text(
                              "Total in cart",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: kExtraLargeFontSize15),
                            ),
                            SizedBox(
                              width: kDefaultMargin,
                            ),
                            Container(
                              width: 20.sp,
                              height: 20.sp,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Center(
                                  child: Obx((){
                                    return Text(
                                      "${mCartController.mAddToCartList.length}",
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: kMediumFontSize11),
                                    );
                                  })
                              ),
                            ),
                            Spacer(),
                            Obx((){
                              return Text(
                                "Ks ${mCartController.totalPrice}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: kExtraLargeFontSize15),
                              );
                            })
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        }

        ),
      ),
    );
  }
}
