import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/order_date_filter_model.dart';
import 'package:whole_snack/core/model/data_model/order_info_model.dart';
import 'package:whole_snack/core/model/data_model/order_item_model.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/core/repos/order_repo.dart';
import 'package:whole_snack/features/order_detail/controller/order_detail_page_controller.dart';

class OrderController extends GetxController {
  var firstDate = DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day - 1)
      .toString()
      .substring(0, 10);
  var secondDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .toString()
          .substring(0, 10);

  late OrderRepo orderRepo;
  late OrderDetailPageController _detailPageController;

  late int id;
  RxList<OrderInfoModel> orderItemList = RxList();



  OrderController() {
    var date1 = DateTime.parse("$firstDate");
    var date2 = DateTime.parse("$secondDate");
    var formattedDate1 = "${date1.year}-${date1.month}-${date1.day}";
    var formattedDate2 = "${date2.year}-${date2.month}-${date2.day}";
    orderRepo = Get.put(OrderRepo());



    getOrderInfoList(OrderDateFilterModel(
        customerId: "129", from: formattedDate1, to: formattedDate2));
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
          : DateTime(DateTime.now().year, DateTime.now().month),
      lastDate: new DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
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

    id == 1 ? firstDate = date : secondDate = date;
    update();
  }

  getOrderInfoList(OrderDateFilterModel model) async {
    HttpGetResult<OrderInfoModel> result =
        await orderRepo.getFilterOrderInfo(model);

    orderItemList.addAll(result.mData);




  }

  getByDate(var date1, var date2) {
    orderItemList.clear();
    date1 = DateTime.parse("$firstDate");
    date2 = DateTime.parse("$secondDate");
    var formattedDate1 = "${date1.year}-${date1.month}-${date1.day}";
    var formattedDate2 = "${date2.year}-${date2.month}-${date2.day}";


    getOrderInfoList(OrderDateFilterModel(
        customerId: "129", from: formattedDate1, to: formattedDate2));
  }

  gerOrderId(String ordId) {
    id = int.parse(ordId);



  }




}
