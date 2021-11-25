import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';

import 'package:whole_snack/core/utils/size_config.dart';
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
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: kLargeFontSize13.sp,
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
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                "Nov 7, 2021",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: kLargeFontSize14.sp,
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Text(
                "Ks. 50000",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: kExtraLargeFontSize15.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 8,
              ),
              Icon(Icons.arrow_forward_ios,size: 15.sp, color: Colors.black,)

            ],
          ),
          Text(
            "Order Code #8488394",
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondaryVariant,

                fontSize: kMediumFontSize11.sp,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          Row(

            children: [
             SvgPicture.asset("assets/images/bag.svg",color: Theme.of(context).colorScheme.onPrimary,width: 12.sp,height: 12.sp,),
              SizedBox(width: 8,),
              Flexible(
                child: Text(
                  "80 Street, Corner Of 16 Street, AMP Tsp, Mandalay",
                  
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: kMediumFontSize11.sp,
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
                  color: Color(0xff0400B7)
               ),
             ),
              SizedBox(width: 8,),
              Flexible(
                child: Text(
                  "Order Processing",

                  style: TextStyle(
                      color: Color(0xff0400B7),
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
                    color: Theme.of(context).colorScheme.secondaryVariant,
                    fontSize: kLargeFontSize13.sp,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "Track Order",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: kLargeFontSize13.sp,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),



        ],
      ),

    ),
  );

}
