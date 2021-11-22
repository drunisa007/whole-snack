import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/order_detail/controller/order_detail_page_controller.dart';

Widget orderDetailPageAllWidget(BuildContext context, SizeConfig sizeConfig,
    OrderDetailPageController controller) {
  List<Widget> data = [
    _buildProductScroll(context, sizeConfig, controller),
    _buildProductScroll(context, sizeConfig, controller),
    _buildProductScroll(context, sizeConfig, controller),
    _buildProductScroll(context, sizeConfig, controller)
  ];
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView(
      children: [
        SizedBox(
          height: 16,
        ),
        _buildStepperWidget(context, sizeConfig, controller),

        _buildProductScroll(context, sizeConfig, controller),
        SizedBox(
          height: 16,
        ),
        _buildDeliveryAddress(context, sizeConfig, controller),
        SizedBox(
          height: 16,
        ),
        Center(
          child:GestureDetector(
            onTap: () {},
            child: Container(
              height: sizeConfig.blockSizeHorizontal * 10,
              width: sizeConfig.blockSizeVertical*30,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      "Cancel This Order",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: kExtraLargeFontSize16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
          )
        ),
      ],
    ),
  );
}
///build stepper widget for order tracking
Widget _buildStepperWidget(BuildContext context, SizeConfig sizeConfig,
    OrderDetailPageController controller) {
  return Stepper(
    controlsBuilder: (BuildContext context,
        {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
      return Container();
    },
    steps: const <Step>[
      Step(
        title: Text('Order Processing'),
        content: SizedBox(
            //   height: 8,
            ),
      ),
      Step(
        isActive: true,
        title: Text('Order Receive'),
        content: SizedBox(
          height: 8,
        ),
      ),
      Step(
        title: Text('Order Delivery'),
        content: SizedBox(
            //  height: 8,
            ),
      ),
      Step(
        title: Text('Order Complete'),
        content: SizedBox(
            //   height: 8,
            ),
      ),
    ],
  );
}

///bui
Widget _buildDeliveryRiderProfile(BuildContext context, SizeConfig sizeConfig,
    OrderDetailPageController controller) {
  return Container(
    padding: EdgeInsets.all(8),
    color: Colors.white,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          //borderRadius: BorderRadius.circular(100),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,


          ),


       child: Image.asset("assets/images/snack.png",width: sizeConfig.safeBlockVertical*8,height: sizeConfig.safeBlockHorizontal*12,fit: BoxFit.fitHeight,)
    ),

        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Apolo layer Cake x1",style:TextStyle(color:Colors.black,fontSize: kExtraLargeFontSize16.sp,fontWeight: FontWeight.w500)),
            Text("1pc 250Kyats",style:TextStyle(color:Colors.grey,fontSize: kLargeFontSize14.sp,fontWeight: FontWeight.w500)),

          ],


        ),
        Spacer(),
        Text("1pc|Ks.250",style:TextStyle(color:Theme.of(context).primaryColor,fontSize: kLargeFontSize14.sp,fontWeight: FontWeight.w500)),
      ],
    )
  );
}

Widget _buildProductScroll(BuildContext context, SizeConfig sizeConfig,
    OrderDetailPageController controller) {
  return Container(
      padding: EdgeInsets.all(8),
      color: Colors.white,
      child: /*Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Image.asset("assets/images/snack.png",width: sizeConfig.safeBlockVertical*12,height: sizeConfig.safeBlockHorizontal*18,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Apolo layer Cake x1",style:TextStyle(color:Colors.black,fontSize: kExtraLargeFontSize16.sp,fontWeight: FontWeight.w500)),
            Text("1pc 250Kyats",style:TextStyle(color:Colors.grey,fontSize: kLargeFontSize14.sp,fontWeight: FontWeight.w500)),

          ],


        ),
        Spacer(),
        Text("1pc|Ks.250",style:TextStyle(color:Theme.of(context).primaryColor,fontSize: kLargeFontSize14.sp,fontWeight: FontWeight.w500)),
      ],
    )*/

          Column(
        children: [
          /*     ListTile(


          leading:   Image.asset("assets/images/snack.png",width: sizeConfig.safeBlockVertical*12,height: sizeConfig.safeBlockHorizontal*18,),
          title: Text("Apolo layer Cake x1",style:TextStyle(color:Colors.black,fontSize: kExtraLargeFontSize16.sp,fontWeight: FontWeight.w500)),
          subtitle: Text("1pc 250Kyats",style:TextStyle(color:Colors.grey,fontSize: kLargeFontSize14.sp,fontWeight: FontWeight.w500)),
          trailing: Text("1pc|Ks.250",style:TextStyle(color:Theme.of(context).primaryColor,fontSize: kLargeFontSize14.sp,fontWeight: FontWeight.w500)),


        ),*/
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
                          fontSize: kExtraLargeFontSize16.sp,
                          fontWeight: FontWeight.w500)),
                  Text("1pc 250Kyats",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: kLargeFontSize14.sp,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              Spacer(),
              Text("1pc|Ks.250",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: kLargeFontSize14.sp,
                      fontWeight: FontWeight.w500)),
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
                          fontSize: kExtraLargeFontSize16.sp,
                          fontWeight: FontWeight.w500)),
                  Text("1pc 250Kyats",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: kLargeFontSize14.sp,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              Spacer(),
              Text("1pc|Ks.250",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: kLargeFontSize14.sp,
                      fontWeight: FontWeight.w500)),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Item Total",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: kLargeFontSize14.sp,
                  )),
              Text("Ks.3000",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: kLargeFontSize14.sp,
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
                    color: Colors.grey,
                    fontSize: kLargeFontSize14.sp,
                  )),
              Text("1000 Kyats",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: kLargeFontSize14.sp,
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
                      color: Colors.grey,
                      fontSize: kExtraLargeFontSize16.sp,
                      fontWeight: FontWeight.bold)),
              Text("Ks.4000",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: kExtraLargeFontSize16.sp,
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
                    color: Colors.black,
                    fontSize: kExtraLargeFontSize16.sp,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: "45 E 45 St Myamandalar ,Mandalay",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: kLargeFontSize14.sp,
                    fontWeight: FontWeight.w500)),
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
