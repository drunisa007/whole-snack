import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/temp_model/temp_addtocart_model.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/cart/controller/cart_controller.dart';

class BuildCheckOutList extends StatelessWidget {
  const BuildCheckOutList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    CartController mCartController = Get.find<CartController>();
    SizeConfig mSizeConfig = Get.find<SizeConfig>();

    mSizeConfig.init(context);
    return ListView.separated(itemBuilder: (context,index){
      return GestureDetector(
        onTap: (){
          print("this is working");
        },
        child: Container(
          width: double.infinity,
          height: mSizeConfig.blockSizeVertical * 10.9,
          padding: EdgeInsets.only(
            left: kDefaultMargin.sp,
            right: kDefaultMargin.sp,
            top: kDefaultMargin.sp ,
            bottom: kDefaultMargin.sp,
          ),
          child: Center(
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      child: CachedNetworkImage(
                        imageUrl: "${mCartController.mAddToCartList[index].image}",
                        fit: BoxFit.contain,
                        placeholder: (context, url) => Image.asset(
                          "assets/images/place_holder.jpeg",
                          fit: BoxFit.cover,
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          "assets/images/place_holder.jpeg",
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
                            "${mCartController.mAddToCartList[index].title}",
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: kLargeFontSize13,
                                letterSpacing: 0.3,
                                fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                "${mCartController.mAddToCartList[index].itemPackage.quantity}",
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
                                "${mCartController.mAddToCartList[index].itemPackage.price} Ks",
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
                          Text('Qty : ${mCartController.mAddToCartList[index].count}',style: TextStyle(
                            color: Theme.of(context).colorScheme.secondaryVariant,
                           fontSize: kLargeFontSize14.sp,
                            fontWeight: FontWeight.w600
                          ),)
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      );
    },
      shrinkWrap: false,
      itemCount: mCartController.mAddToCartList.length,
      separatorBuilder: (BuildContext context, int index) {
      return Divider();
      },
    );
  }
}
