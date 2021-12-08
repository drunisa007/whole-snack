import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/data_model/order_date_filter_model.dart';
import 'package:whole_snack/core/model/data_model/order_info_model.dart';
import 'package:whole_snack/core/model/data_model/order_item_model.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/core/repos/helper/secure_storage_helper.dart';
import 'package:whole_snack/core/repos/order_repo.dart';
import 'package:whole_snack/features/cart/controller/cart_controller.dart';
import 'package:whole_snack/features/order_detail/controller/order_detail_page_controller.dart';

class OrderController extends GetxController {
  var firstDate = DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day-1 )
      .toString()
      .substring(0, 10);
  var secondDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .toString()
          .substring(0, 10);

  var tempDate1 = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day-1)
      .toString()
      .substring(0, 10);
  var tempDate2 =
  DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day+1)
      .toString()
      .substring(0, 10);

  late OrderRepo orderRepo;
  late OrderDetailPageController _detailPageController;

  RxInt mOrdId = RxInt(-1);
  RxList<OrderInfoModel> orderItemList = RxList();
  RxBool loading = RxBool(true);
  RxString errorMessage = RxString("");


  CartController mCartController = Get.find<CartController>();


  FetchOrderController() {

    var date1 = DateTime.parse("$firstDate");
    var date2 = DateTime.parse("$secondDate");
    var formattedDate1 = "${date1.year}-${date1.month}-${date1.day}";
    var formattedDate2 = "${date2.year}-${date2.month}-${date2.day}";
    var temp1 = "${date1.year}-${date1.month}-${date1.day-1}";
    var temp2 = "${date2.year}-${date2.month}-${date2.day+1}";


    orderRepo = Get.put(OrderRepo());



    if(mCartController.token.value.isNotEmpty){

      getOrderInfoList(OrderDateFilterModel(
          customerId: mCartController.customId.value.toString(), from: temp1, to: temp2));
    }
     else {
       loading.value = false;
       errorMessage.value = "auth";
    }
  }


  ///for the order filter using date picker
  showDataPicker(context, int id) async {
    var result = await showDatePicker(
      context: context,
      initialDate: id == 1
          ? DateTime(
              DateTime.now().year,
              DateTime.now().month,
            )
          : DateTime(DateTime.now().year, DateTime.now().month,DateTime.now().day-1),
      lastDate: new DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day+1),
      firstDate: DateTime(2021),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary:
                  Theme.of(context).primaryColor, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Theme.of(context).primaryColor, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.red, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    String date = result.toString().substring(0, 10);

    id == 1 ? tempDate1 = date : tempDate2 = date;
    update();
  }

  getOrderInfoList(OrderDateFilterModel model) async {

    loading.value = true;
    HttpGetResult<OrderInfoModel> result =
        await orderRepo.getFilterOrderInfo(model);
    loading.value = false;
    if(result.isSuccessful) {
      errorMessage.value = "";
      orderItemList.clear();
      orderItemList.addAll(result.mData.reversed);
    }

    else {
      errorMessage.value = result.errorMessage;
    }

  }

  getByDate(var date1, var date2) {
    orderItemList.clear();
    date1 = DateTime.parse("$firstDate");
    date2 = DateTime.parse("$secondDate");
    var formattedDate1 = "${date1.year}-${date1.month}-${date1.day}";
    var formattedDate2 = "${date2.year}-${date2.month}-${date2.day}";


     if(mCartController.token.value.isNotEmpty){
       getOrderInfoList(OrderDateFilterModel(
           customerId: mCartController.customId.value.toString(), from: formattedDate1, to: formattedDate2));
     }


  }

  gerOrderId(String ordId) {
    mOrdId.value = int.parse(ordId);
  }



}
