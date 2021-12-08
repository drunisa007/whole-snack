import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/build_custom_button.dart';
import 'package:whole_snack/features/customer_support/controller/customer_support_page_controller.dart';
import 'package:whole_snack/features/order_detail/controller/order_detail_page_controller.dart';

Widget orderDetailPageAllWidget(BuildContext context, SizeConfig sizeConfig,
    OrderDetailPageController controller) {

  return Obx(
      () => controller.orderInfoList.length==0 ? Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,))

  : Column(
    children: [
      Flexible(
        child: ListView(
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

        Flexible(child: _buildProductScroll(context, sizeConfig, controller)),

            SizedBox(
              height: 16,
            ),
            _buildDeliveryAddress(context, sizeConfig, controller),
            SizedBox(
              height: 16,
            ),

          ],
        ),
      ),


     /* controller.orderInfoList[0].ordStatus=="0"? BuildCustomButton(haveCorner: false, action: ()=>print("hahah"), title:"Cancel Order") : SizedBox(width: 0,)
*/
    ],
  )
  );
}





///build new stepper
///
Widget _buildNewStepper(BuildContext context,SizeConfig sizeConfig,
OrderDetailPageController controller) {

  Color stepperColor = Color(0xffC4C4C4);
  Color titleColor = Color(0xff0400B7);
  String orderTitle = "Order Processing";
 int status = 4;

 switch(status) {

   case 1 :
     orderTitle = "Order Processing";
     titleColor = Color(0xff0400B7);
     break;
   case 2 :
     orderTitle = "Order Receive";
     titleColor = Color(0xff076AFF);
     break;
   case 3:
     orderTitle = "Order Delivered";
     titleColor = Color(0xffFB9600);
     break;
   case 4 :
     orderTitle = "Order Complete";
     titleColor = Color(0xff00A96C);
     break;


 }



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

                  TextSpan(text: "${controller.orderInfoList[0].ordCreate.substring(0,10)} \n",
                      style: TextStyle(
                          color: Colors.black, fontSize: kLargeFontSize14.sp,fontWeight: FontWeight.bold)),

                  TextSpan(text: "Order  #${controller.orderInfoList[0].ordId}",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondaryVariant, fontSize: kMediumFontSize11.sp,fontWeight: FontWeight.bold)),
                ]
            )),
            Spacer(),

            CircleAvatar(
              radius: sizeConfig.blockSizeVertical*1,

              backgroundColor: titleColor,
            ),
            SizedBox(width: kDefaultMargin,),
            Text(orderTitle,
                style: TextStyle(
                    color: titleColor, fontSize: kMediumFontSize12.sp,fontWeight: FontWeight.bold)),


          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [



                Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: sizeConfig.blockSizeVertical*1,

                          backgroundColor: status>=1 ? Color(0xff00A96C) : stepperColor,
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
                          color: status>=1 ? Color(0xff00A96C) : stepperColor, fontSize: kMediumFontSize11.sp,)),


                  ],
                ),
                Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: sizeConfig.blockSizeVertical*1,

                          backgroundColor: status>=2 ? Color(0xff00A96C) : stepperColor,
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
                    Text( "Order Receive",
                        style: TextStyle(
                          color: status>=2 ? Color(0xff00A96C) : stepperColor, fontSize: kMediumFontSize11.sp,)),


                  ],
                ),
                Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: sizeConfig.blockSizeVertical*1,

                          backgroundColor: status>=3 ? Color(0xff00A96C) : stepperColor,
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
                    Text( "Order Delivered",
                        style: TextStyle(
                          color: status>=3 ? Color(0xff00A96C) : stepperColor, fontSize: kMediumFontSize11.sp,)),


                  ],
                ),
                Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: sizeConfig.blockSizeVertical*1,

                          backgroundColor: status>=4 ? Color(0xff00A96C) : stepperColor,
                          child: Icon(Icons.check,size: kMediumFontSize12.sp,color: Colors.white,),
                        ),

                      ],
                    ),
                    SizedBox(width: kDefaultMargin,),
                    Text( "Order Completed",
                        style: TextStyle(
                          color: status>=4 ? Color(0xff00A96C) : stepperColor, fontSize: kMediumFontSize11.sp,)),


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

  CustomerSupportPageController supportPageController = Get.put(CustomerSupportPageController());
  return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultMargin,vertical: kDefaultMargin),
      color: Colors.white,
      child: Row(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Icon(Icons.account_circle,size: sizeConfig.blockSizeHorizontal*8,)),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(controller.orderInfoList[0].riderId,
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
            onTap:()=> supportPageController.launchLinks(controller.orderInfoList[0].riderPhone, ),
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
      height: sizeConfig.blockSizeVertical*35,
      color: Colors.white,
      child:  Column(
        children: [

          Flexible(
            child: ListView.builder(
              itemCount: controller.orderItemList.length,
              itemBuilder: (context,index) {
                return Row(
                  children: [
                    Image.asset(
                      "assets/images/snack.png",
                  //    controller.orderItemList[index].itemImage,
                      width: sizeConfig.safeBlockVertical * 12,
                      height: sizeConfig.safeBlockHorizontal * 18,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex : 6,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(controller.orderItemList[index].itemName,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: kLargeFontSize13.sp,
                                  fontWeight: FontWeight.bold
                              )),
                    /*      Text("1pc 250Kyats",
                              style: TextStyle(
                                color :  Theme.of(context).colorScheme.onPrimary,
                                fontSize: kSmallFontSize10.sp,

                              )),*/
                        ],
                      ),
                    ),
                    Spacer(),
                    Text("${controller.orderItemList[index].qty} Pcs / ${controller.orderItemList[index].price}",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                         fontWeight: FontWeight.bold,
                          fontSize: kLargeFontSize13.sp,
                        )),
                  ],
                );
              }
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Delivery Fees",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: kLargeFontSize13.sp,
                  )),
              Text("${controller.orderInfoList[0].deliveryFee} Kyats",
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
              Text("${controller.orderInfoList[0].ordPrice}",
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
                text: controller.orderInfoList[0].ordAddress,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: kLargeFontSize13.sp,
                    fontWeight: FontWeight.bold)),
            // TextSpan(
            //     text: "45 E 45 St Myamandalar ,Mandalay",
            //     style: TextStyle(
            //       color: Theme.of(context).colorScheme.onPrimary,
            //       fontSize: kMediumFontSize12.sp,
            //     )),
          ]))
          //  Text("Home",style: TextStyle(color: Colors.black,fontSize: kExtraLargeFontSize16.sp,fontWeight: FontWeight.bold)),
          // Text("45 E 45 St Myamandalar ,Mandalay",style: TextStyle(color: Colors.grey,fontSize: kLargeFontSize14.sp,fontWeight: FontWeight.w500)),
        ],
      )

      );
}
