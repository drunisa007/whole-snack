import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/temp_model/temp_addtocart_model.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/cart/controller/cart_controller.dart';

class BuildAddToCartListSingle extends StatelessWidget {
  final int index;

  BuildAddToCartListSingle(
      {Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);

    CartController mCartController = Get.find<CartController>();
    TempAddToCartModel mModel = mCartController.mAddToCartList[index];

    return Container(
      width: double.infinity,
      height: mSizeConfig.blockSizeVertical *13.7,
      padding: EdgeInsets.only(
        left: kDefaultMargin.sp,
        right: kDefaultMargin.sp,
        top: kDefaultMargin.sp-4.sp,
        bottom: kDefaultMargin.sp-4.sp,
      ),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                child: CachedNetworkImage(
                  imageUrl: "${mModel.image}",
                  fit: BoxFit.contain,
                  placeholder: (context, url) => Image.asset(
                    "assets/images/place_holder.png",
                    fit: BoxFit.cover,
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    "assets/images/place_holder.png",
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.only(left: kDefaultMargin.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mModel.title,
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: kLargeFontSize13,
                          letterSpacing: 0.3,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      mModel.originalPrice,
                      style: TextStyle(
                          fontSize: kSmallFontSize10,
                          color: Theme.of(context).colorScheme.onSecondary
                          ),
                    ),
                    Row(
                      children: [
                        Text(
                          mModel.itemPackage.quantity,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: kLargeFontSize13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 10.sp,
                        ),
                        Text(
                          mModel.itemPackage.price,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            fontSize: kLargeFontSize13,
                            fontWeight: FontWeight.w600,),
                        ),
                      ],
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        mCartController.removeOldCart(index);
                      },
                      child: Container(
                        width: 30.sp,
                        height: 25.sp,
                        child: Center(
                          child: Icon(
                            Icons.clear_outlined,
                            size: 18.sp,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: (){
                            mCartController.removeNewCount(index);
                          },
                          child: Container(
                            width: 30.sp,
                            height: 30.sp,
                            child: Center(
                              child: Container(
                                width: 18.sp,
                                height: 18.sp,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(5.sp),
                                    border: Border.all(
                                        color: mModel.count > 1
                                            ? Colors.black
                                            : Colors.grey,
                                        width: 1.5.sp)),
                                child: Center(
                                  child: Icon(
                                    Icons.remove_outlined,
                                    size: 15.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: mSizeConfig.blockSizeVertical * 3,
                          child: Center(
                            child: Text(
                              mCartController.mAddToCartList[index].count.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: kLargeFontSize14),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            mCartController.addNewCount(index);
                          },
                          child: Container(
                            width: 30.sp,
                            height: 30.sp,
                            child: Center(
                              child: Container(
                                width: 18.sp,
                                height: 18.sp,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(5.sp),
                                    border: Border.all(
                                        color: Colors.black, width: 1.5.sp)),
                                child: Center(
                                  child: Icon(Icons.add_outlined, size: 15.sp),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )

                  ],
                ),
              )),
        ],
      ),
    );
  }
}
