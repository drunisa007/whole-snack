import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/data_model/order_date_filter_model.dart';

import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/build_custom_button.dart';

import 'package:whole_snack/features/order/controller/order_controller.dart';

Widget orderPageAllWidget(
    BuildContext context, SizeConfig sizeConfig, OrderController controller) {
  bool isDate = true;


  return Container(
    margin: EdgeInsets.all(kDefaultMargin),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 1,
                child: GetBuilder<OrderController>(
                  builder: (controller) => _buildFilter(
                      context,
                      sizeConfig,
                      controller,
                      "From",
                      isDate,
                      () => controller.showDataPicker(context, 1),
                      "${controller.firstDate}"),
                )),
            SizedBox(
              width: 8,
            ),
            Expanded(
                flex: 1,
                child: GetBuilder<OrderController>(
                  builder: (controller) => _buildFilter(
                      context,
                      sizeConfig,
                      controller,
                      "To",
                      isDate,
                      () => controller.showDataPicker(context, 2),
                      "${controller.secondDate}"),
                )),
            SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 1,
              child: _buildFilter(context, sizeConfig, controller, "", !isDate,
                  () => print(isDate), "${controller.firstDate}"),
            ),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Obx(
          () =>  Flexible(
            child: controller.orderItemList.length == 0
                ? Text("No Order Found")
                : ListView.builder(
                    itemCount: controller.orderItemList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap:() {

                          controller.gerOrderId(controller.orderItemList[index].ordId);
                          Get.toNamed("/order-detail-page");





                        },
                        child: _buildOrderHistoryCard(
                            context, sizeConfig, controller, index),
                      );
                    },
                  ),
          ),
        )
      ],
    ),
  );
}

///Build date picker and apply button to filte order history

Widget _buildFilter(
    BuildContext context,
    SizeConfig sizeConfig,
    OrderController controller,
    String title,
    bool isDate,
    Function onClick,
    String date) {
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
                ? BuildCustomButton(
                    haveCorner: true, action: () => onClick(), title: "$date")
                : BuildCustomButton(
                    haveCorner: false,
                    action: () => {

                          controller.getByDate(
                              controller.firstDate, controller.secondDate),
                       /*   controller.getOrderInfoList(OrderDateFilterModel(
                              customerId: controller.customerId.toString(),
                              from: controller.firstDate,
                              to: controller.secondDate)),*/
                        },
                    title: "Apply")),
      ],
    ),
  );
}

///build order histroy  card style
Widget _buildOrderHistoryCard(BuildContext context, SizeConfig sizeConfig,
    OrderController controller, int index) {
  String orderStatusText = "";
  Color color = Color(0xaa0400B7);
  Color cancelButtonColor = Theme.of(context).colorScheme.onPrimary;

  ///check orderStatusTExt
  switch (controller.orderItemList[index].ordStatus) {


    case "0":
      color = Color(0xff0400B7);
      cancelButtonColor = Color(0xff3D3D3D);
      orderStatusText = "Order Processing";
      break;
    case "1":
      color = Color(0xffFB9600);
      orderStatusText = "Order Delivery";
      break;
    case "3":
      color = Color(0xff076AFF);

      orderStatusText = "Order Received";
      break;

    default:
      cancelButtonColor = Color(0xffC4C4C4);
  }

  return controller.orderItemList.length ==0 ? Text("No Data Found")  : Card(
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
                controller.orderItemList[index].ordCreate
                    .toString()
                    .substring(0, 10),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: kLargeFontSize14.sp,
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Text(
                controller.orderItemList[index].ordPrice,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: kExtraLargeFontSize15.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 15.sp,
                color: Colors.black,
              )
            ],
          ),
          Text(
            controller.orderItemList[index].ordId,
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
              SvgPicture.asset(
                "assets/images/bag.svg",
                color: Theme.of(context).colorScheme.onPrimary,
                width: 12.sp,
                height: 12.sp,
              ),
              SizedBox(
                width: 8,
              ),
              Flexible(
                child: Text(
                  controller.orderItemList[index].ordAddress,
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
                height: sizeConfig.blockSizeHorizontal * 3,
                width: sizeConfig.blockSizeVertical * 3,
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
              ),
              SizedBox(
                width: 8,
              ),
              Flexible(
                child: Text(
                  orderStatusText,
                  style: TextStyle(
                      color: color,
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
              InkWell(

                onTap: (){

                  if(controller.orderItemList[index].ordStatus == "0") {


                    print(controller.orderItemList[index].ordStatus);
                  }

                },

                child: Text(
                  "Cancel Order",
                  style: TextStyle(
                      color: cancelButtonColor,
                      fontSize: kLargeFontSize13.sp,
                      fontWeight: FontWeight.w500),
                ),
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
