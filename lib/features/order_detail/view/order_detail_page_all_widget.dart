import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/build_custom_button.dart';
import 'package:whole_snack/features/order_detail/controller/order_detail_page_controller.dart';

Widget orderDetailPageAllWidget(BuildContext context, SizeConfig sizeConfig,
    OrderDetailPageController controller) {
  List<Widget> data = [
    _buildProductScroll(context, sizeConfig, controller),
    _buildProductScroll(context, sizeConfig, controller),
    _buildProductScroll(context, sizeConfig, controller),
    _buildProductScroll(context, sizeConfig, controller)
  ];
  return ListView(
    children: [
       SizedBox(
        height: 16,
      ),


    //  _buildStepper(context, sizeConfig, controller),
      _buildNewStepper(context, sizeConfig, controller),
      SizedBox(
        height: 16,
      ),
      _buildDeliveryRiderProfile(context, sizeConfig, controller),
      SizedBox(
        height: 16,
      ),
      _buildProductScroll(context, sizeConfig, controller),
      SizedBox(
        height: 16,
      ),
      _buildDeliveryAddress(context, sizeConfig, controller),
      SizedBox(
        height: 16,
      ),
   /*   Center(
        child: Container(
            width: sizeConfig.blockSizeHorizontal * 50,
            child: BuildCustomButton(
                haveCorner: true,
                action: () => Get.back(),
                title: "Cancel this order")),
      ),*/
    ],
  );
}



/*
Widget _buildStepper(BuildContext context, SizeConfig sizeConfig,
    OrderDetailPageController controller) {

  return Container(
    color: Colors.white,
    padding: EdgeInsets.all(kDefaultMargin),


    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Row(
          children: [

            RichText(text: TextSpan(
              children: [

                TextSpan(text: "Nov 7 2021\n",
                    style: TextStyle(
                        color: Colors.black, fontSize: kLargeFontSize14.sp,fontWeight: FontWeight.bold)),

                TextSpan(text: "Order  #DN-A00122",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondaryVariant, fontSize: kMediumFontSize11.sp,fontWeight: FontWeight.bold)),
              ]
            )),
            Spacer(),

            CircleAvatar(
            radius: sizeConfig.blockSizeVertical*1,

              backgroundColor: Color(0xffFB9600),
            ),
            SizedBox(width: kDefaultMargin,),
            Text( "Order processing",
                style: TextStyle(
                    color: Color(0xffFB9600), fontSize: kMediumFontSize12.sp,fontWeight: FontWeight.bold)),


          ],
        ),
        SizedBox(
          height: 16,
        ),

        Row(

          children: [
            CircleAvatar(
              radius: sizeConfig.blockSizeVertical*1,

              backgroundColor: Color(0xff00A96C),
              child: Icon(Icons.check,size: kMediumFontSize12.sp,color: Colors.white,),
            ),
            SizedBox(width: kDefaultMargin,),
            Text( "Order processing",
                style: TextStyle(
                    color: Color(0xff00A96C), fontSize: kMediumFontSize11.sp,)),
            Spacer(

            ),
            Text( "9:30 PM",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary, fontSize: kMediumFontSize11.sp,)),

          ],
        ),

        Container(
          height: sizeConfig.blockSizeHorizontal*5,
          width: 1.0,
          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.3),
          margin: const EdgeInsets.only(left: 5.0),
        ),
        Row(

          children: [
            CircleAvatar(
              radius: sizeConfig.blockSizeVertical*1,

              backgroundColor: Color(0xff00A96C),
              child: Icon(Icons.check,size: kMediumFontSize12.sp,color: Colors.white,),
            ),
            SizedBox(width: kDefaultMargin,),
            Text( "Order Receive",
                style: TextStyle(
                  color: Color(0xff00A96C), fontSize: kMediumFontSize11.sp,)),
            Spacer(

            ),
            Text( "9:34 PM",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary, fontSize: kMediumFontSize11.sp,)),

          ],
        ),

        Container(
          height: sizeConfig.blockSizeHorizontal*5,
          width: 1.0,
          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.3),
          margin: const EdgeInsets.only(left: 7.0),
        ),
        Row(

          children: [
            CircleAvatar(
              radius: sizeConfig.blockSizeVertical*1,

              backgroundColor: Color(0xff00A96C),
              child: Icon(Icons.check,size: kMediumFontSize12.sp,color: Colors.white,),
            ),
            SizedBox(width: kDefaultMargin,),
            Text( "Order Delivery",
                style: TextStyle(
                  color: Color(0xff00A96C), fontSize: kMediumFontSize11.sp,)),
            Spacer(

            ),
            Text( "9:45 PM",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary, fontSize: kMediumFontSize11.sp,)),

          ],
        ),

        Container(
          height: sizeConfig.blockSizeHorizontal*5,
          width: 1.0,
          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.4),
          margin: const EdgeInsets.only(left: 7.0),
        ),
        Row(

          children: [
            CircleAvatar(
              radius: sizeConfig.blockSizeVertical*1,

              backgroundColor:  Theme.of(context).colorScheme.onPrimary.withOpacity(0.3),

            ),
            SizedBox(width: kDefaultMargin,),
            Text( "Order Complete",
                style: TextStyle(
                  color:Theme.of(context).colorScheme.onPrimary, fontSize: kMediumFontSize11.sp,)),


          ],
        ),







      ],
    ),

  );
}*/

///build new stepper
///
Widget _buildNewStepper(BuildContext context,SizeConfig sizeConfig,
OrderDetailPageController controller) {


  return Container(
    padding: const EdgeInsets.all(kDefaultMargin),
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [

            RichText(text: TextSpan(
                children: [

                  TextSpan(text: "Nov 7 2021\n",
                      style: TextStyle(
                          color: Colors.black, fontSize: kLargeFontSize14.sp,fontWeight: FontWeight.bold)),

                  TextSpan(text: "Order  #DN-A00122",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondaryVariant, fontSize: kMediumFontSize11.sp,fontWeight: FontWeight.bold)),
                ]
            )),
            Spacer(),

            CircleAvatar(
              radius: sizeConfig.blockSizeVertical*1,

              backgroundColor: Color(0xffFB9600),
            ),
            SizedBox(width: kDefaultMargin,),
            Text( "Order processing",
                style: TextStyle(
                    color: Color(0xffFB9600), fontSize: kMediumFontSize12.sp,fontWeight: FontWeight.bold)),


          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Column(
              children: [



                Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: sizeConfig.blockSizeVertical*1,

                          backgroundColor: Color(0xff00A96C),
                          child: Icon(Icons.check,size: kMediumFontSize12.sp,color: Colors.white,),
                        ),
                        Container(
                          height: sizeConfig.blockSizeHorizontal*5,
                          width: 1.0,
                          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.3),

                        ),
                      ],
                    ),
                    SizedBox(width: kDefaultMargin,),
                    Text( "Order processing",
                        style: TextStyle(
                          color: Color(0xff00A96C), fontSize: kMediumFontSize11.sp,)),


                  ],
                ),
                Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: sizeConfig.blockSizeVertical*1,

                          backgroundColor: Color(0xff00A96C),
                          child: Icon(Icons.check,size: kMediumFontSize12.sp,color: Colors.white,),
                        ),
                        Container(
                          height: sizeConfig.blockSizeHorizontal*5,
                          width: 1.0,
                          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.3),

                        ),
                      ],
                    ),
                    SizedBox(width: kDefaultMargin,),
                    Text( "Order processing",
                        style: TextStyle(
                          color: Color(0xff00A96C), fontSize: kMediumFontSize11.sp,)),


                  ],
                ),
                Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: sizeConfig.blockSizeVertical*1,

                          backgroundColor: Color(0xff00A96C),
                          child: Icon(Icons.check,size: kMediumFontSize12.sp,color: Colors.white,),
                        ),
                        Container(
                          height: sizeConfig.blockSizeHorizontal*5,
                          width: 1.0,
                          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.3),

                        ),
                      ],
                    ),
                    SizedBox(width: kDefaultMargin,),
                    Text( "Order processing",
                        style: TextStyle(
                          color: Color(0xff00A96C), fontSize: kMediumFontSize11.sp,)),


                  ],
                ),
                Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: sizeConfig.blockSizeVertical*1,

                          backgroundColor: Color(0xff00A96C),
                          child: Icon(Icons.check,size: kMediumFontSize12.sp,color: Colors.white,),
                        ),
                        Container(
                          height: sizeConfig.blockSizeHorizontal*5,
                          width: 1.0,
                          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.3),

                        ),
                      ],
                    ),
                    SizedBox(width: kDefaultMargin,),
                    Text( "Order processing",
                        style: TextStyle(
                          color: Color(0xff00A96C), fontSize: kMediumFontSize11.sp,)),


                  ],
                ),


              ],
            ),

            Spacer(

            ),
            Column(

              children: [

                Text( "9:30 PM",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary, fontSize: kMediumFontSize11.sp,)),
                SizedBox(  height: sizeConfig.blockSizeHorizontal*5,),
                Text( "9:30 PM",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary, fontSize: kMediumFontSize11.sp,)),
                SizedBox(  height: sizeConfig.blockSizeHorizontal*5,),
                Text( "9:30 PM",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary, fontSize: kMediumFontSize11.sp,)),
                SizedBox(  height: sizeConfig.blockSizeHorizontal*5,),




              ],
            )
          ],
        ),
      ],
    ),
  );
}
Widget _buildDeliveryRiderProfile(BuildContext context, SizeConfig sizeConfig,
    OrderDetailPageController controller) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultMargin,vertical: kDefaultMargin),
      color: Colors.white,
      child: Row(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "assets/images/profile.jpg",
                width: sizeConfig.safeBlockVertical * 8,
                height: sizeConfig.safeBlockVertical * 8,
                fit: BoxFit.cover,
              )),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Aung Pyae",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary, fontSize: kLargeFontSize14,fontWeight: FontWeight.bold)),
              Text("Delivery Rider",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: kSmallFontSize10.sp)),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap:()=> print("hhahhhah"),
            child: CircleAvatar(
                maxRadius: sizeConfig.blockSizeVertical*2,
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(Icons.phone,size: 18.sp,color: Colors.white,)),
          )
        ],
      ));
}

Widget _buildProductScroll(BuildContext context, SizeConfig sizeConfig,
    OrderDetailPageController controller) {
  return Container(
      padding: EdgeInsets.all(8),
      color: Colors.white,
      child:  Column(
        children: [

          Row(
            children: [
              Image.asset(
                "assets/images/snack.png",
                width: sizeConfig.safeBlockVertical * 12,
                height: sizeConfig.safeBlockHorizontal * 18,
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Apolo layer Cake x1",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: kLargeFontSize13.sp,
                          fontWeight: FontWeight.bold
                      )),
                  Text("1pc 250Kyats",
                      style: TextStyle(
                        color :  Theme.of(context).colorScheme.onPrimary,
                        fontSize: kSmallFontSize10.sp,

                      )),
                ],
              ),
              Spacer(),
              Text("1pc|Ks.250",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                   fontWeight: FontWeight.bold,
                    fontSize: kLargeFontSize13.sp,
                  )),
            ],
          ),
          Divider(),
          Row(
            children: [
              Image.asset(
                "assets/images/snack.png",
                width: sizeConfig.safeBlockVertical * 12,
                height: sizeConfig.safeBlockHorizontal * 18,
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Apolo layer Cake x1",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: kLargeFontSize13.sp,
                          fontWeight: FontWeight.bold
                      )),
                  Text("1pc 250Kyats",
                      style: TextStyle(
                        color :  Theme.of(context).colorScheme.onPrimary,
                        fontSize: kSmallFontSize10.sp,

                      )),
                ],
              ),
              Spacer(),
              Text("1pc|Ks.250",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: kLargeFontSize13.sp,
                  )),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Item Total",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: kLargeFontSize13.sp,
                  )),
              Text("Ks.3000",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: kLargeFontSize13.sp,
                  )),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Delivery Fees",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: kLargeFontSize13.sp,
                  )),
              Text("1000 Kyats",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: kLargeFontSize13.sp,
                  )),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Divider(),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Grand Total",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: kLargeFontSize13.sp,
                      fontWeight: FontWeight.bold)),
              Text("Ks.4000",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: kLargeFontSize13.sp,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ));
}

Widget _buildDeliveryAddress(BuildContext context, SizeConfig sizeConfig,
    OrderDetailPageController controller) {
  return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Icon(
            Icons.home_outlined,
            color: Colors.black,
            size: 24.sp,
          ),
          SizedBox(
            width: 16,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "Home\n",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: kLargeFontSize13.sp,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: "45 E 45 St Myamandalar ,Mandalay",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: kMediumFontSize12.sp,
                )),
          ]))
          //  Text("Home",style: TextStyle(color: Colors.black,fontSize: kExtraLargeFontSize16.sp,fontWeight: FontWeight.bold)),
          // Text("45 E 45 St Myamandalar ,Mandalay",style: TextStyle(color: Colors.grey,fontSize: kLargeFontSize14.sp,fontWeight: FontWeight.w500)),
        ],
      )

      /*ListTile(
      leading:Icon(Icons.home_outlined,color: Colors.black,size: 24.sp,),

      title:   Text("Home",style: TextStyle(color: Colors.black,fontSize: kExtraLargeFontSize16.sp,fontWeight: FontWeight.bold)),
      subtitle:  Text("45 E 45 St Myamandalar ,Mandalay",style: TextStyle(color: Colors.grey,fontSize: kLargeFontSize14.sp,fontWeight: FontWeight.w500)),


    ),*/
      );
}
