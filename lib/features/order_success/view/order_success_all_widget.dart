import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/build_custom_button.dart';
import 'package:whole_snack/features/order_success/controller/order_success_controller.dart';

Widget orderSuccessAllWidget(
    BuildContext context,SizeConfig sizeConfig) {
  return Container(
      width: double.infinity,
      padding: EdgeInsets.all(kDefaultMargin),
      child: _buildOrderSuccessBody(context,sizeConfig));
}

Widget _buildOrderSuccessBody(
    BuildContext context,SizeConfig sizeConfig) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCircle(context,sizeConfig),
          SizedBox(
            height: 16,
          ),
          Text("Your Order is submmited!!!!",style: TextStyle(color: Colors.black,fontSize: kMediumFontSize12.sp,fontWeight: FontWeight.bold)),
          SizedBox(
            height: 8,
          ),
          Text("Order Id : 4740303 !!!!",style: TextStyle(color: Colors.grey,fontSize: kSmallFontSize10.sp)),



        ],
      ),
      Column(
        children: [
          BuildCustomButton(haveCorner: false, action: ()=> Get.back(), title: "Track your order"),
          SizedBox(
            height: 16,
          ),
          Text("Continue to Shop other Products",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: kMediumFontSize12.sp)),

          SizedBox(
            height: 24,
          )
        ],
      ),



    ],
  );
}
///build static circle ripple
Container _buildCircle(BuildContext context,SizeConfig sizeConfig) {


  return Container(


    padding: EdgeInsets.all(16),



    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Theme.of(context).primaryColor.withOpacity(0.2),

      border: Border.all(
        color: Theme.of(context).primaryColor.withOpacity(0.2),

      ),
    ),
    child: Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor.withOpacity(0.4),

        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.4),


        ),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor.withOpacity(0.5),

          border: Border.all(
            color: Theme.of(context).primaryColor.withOpacity(0.5),


          ),
        ),
        child: Container(

          padding: EdgeInsets.all(14),


            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,


              border: Border.all(
                color: Theme.of(context).primaryColor,


              ),
            ),

            child: Icon(Icons.check,size: 64.sp,color: Theme.of(context).scaffoldBackgroundColor,)),

      ),

    ),
  );
}


///build button for order track
Column _buildButton(BuildContext context,SizeConfig sizeConfig) {
  
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: double.infinity,
        height: sizeConfig.blockSizeHorizontal*10,
        child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),



          child: Text("hellow world",style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor,fontSize: kExtraLargeFontSize16.sp,fontWeight: FontWeight.w600 ),),
            color: Theme.of(context).primaryColor,

            onPressed: ()=>print("hahahah")
        ),
      ),
      SizedBox(
        height: 16,
      ),
      Text("Continue to Shop other Products",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: kLargeFontSize14.sp)),
      SizedBox(
        height: 26,
      )
    ],

  );
}

