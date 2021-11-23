import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';

import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/constants/default_values.dart';import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/build_custom_button.dart';

import 'package:whole_snack/features/order/controller/order_controller.dart';

Widget orderPageAllWidget(
    BuildContext context, SizeConfig sizeConfig, OrderController controller) {
  bool isDate = true;
  int orderStatus = 01;

  List<Widget> orderCart = [

    _buildOrderHistoryCard(context, sizeConfig, controller,orderStatus),
    _buildOrderHistoryCard(context, sizeConfig, controller,orderStatus),
    _buildOrderHistoryCard(context, sizeConfig, controller,orderStatus),
  ];
  return Container(
    margin: EdgeInsets.all(kDefaultMargin),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
                child: _buildFilter(context, sizeConfig, controller, "From", isDate,()=>print(isDate))),
            SizedBox(width: 8,),
            Expanded(
                flex: 1,child: _buildFilter(context, sizeConfig, controller, "To", isDate,()=>print(isDate))),
            SizedBox(width: 8,),
            Expanded(
              flex: 1,
              child: _buildFilter(
                  context, sizeConfig, controller, "", !isDate,()=>print(isDate)),
            ),


          ],

        ),
        SizedBox(height: 12,),
        Flexible(
          child: ListView(
              children: orderCart.map((e) => e).toList()
          ),
        )

      ],
    ),
  );
}

///Build date picker and apply button to filte order history

Widget _buildFilter(BuildContext context, SizeConfig sizeConfig,
    OrderController controller, String title, bool isDate, Function onClick) {
  return Container(
    padding: EdgeInsets.all(4),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: kMediumFontSize12.sp,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          width: double.infinity,
        /*  width: sizeConfig.safeBlockVertical * 13,*/
          height: sizeConfig.blockSizeHorizontal * 10,
          child: isDate
              ? BuildCustomButton(haveCorner: true, action: ()=>Get.toNamed("/order-detail-page"), title: "11/12/21"):
         BuildCustomButton(haveCorner: false, action: ()=>Get.toNamed("/order-detail-page"), title: "Apply")

        ),
      ],
    ),
  );
}

///build order histroy  card style
Widget _buildOrderHistoryCard(BuildContext context,SizeConfig sizeConfig,OrderController controller,int orderStatus) {


  return Card(


    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: Container(
      margin: EdgeInsets.all(kDefaultMargin),

      width: double.infinity,
      child: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                "Apply",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: kMediumFontSize12.sp,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "Ks. 50000",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: kSmallFontSize10.sp,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Text(
            "Order Code #8488394",
            style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,

                fontSize: kSmallFontSize10.sp,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          Row(

            children: [
              Icon(Icons.shopping_bag,color: Theme.of(context).colorScheme.onPrimary,size: 26.sp,),
              SizedBox(width: 8,),
              Flexible(
                child: Text(
                  "80 Street, Corner Of 16 Street, AMP Tsp, Mandalay",
                  
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: kMediumFontSize12.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),

            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(

            children: [
             Container(
               height: sizeConfig.blockSizeHorizontal*3,
               width: sizeConfig.blockSizeVertical*3,
               decoration: BoxDecoration(
                 shape: BoxShape.circle,
                  color: Colors.blueAccent
               ),
             ),
              SizedBox(width: 8,),
              Flexible(
                child: Text(
                  "Order Processing",

                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: kMediumFontSize12.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),

            ],
          ),
          SizedBox(
            height: 12,
          ),
          Divider(

            height: 3,
          ),
          SizedBox(
            height: 12,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                "Cancel Order",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: kMediumFontSize12.sp,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "Track Order",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: kMediumFontSize12.sp,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),



        ],
      ),

    ),
  );

}
