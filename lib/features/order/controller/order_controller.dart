import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/order_item_model.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/core/repos/order_repo.dart';

class OrderController extends GetxController {
  String firstDate = DateTime(
          DateTime.now().year, DateTime.now().month - 1, DateTime.now().day)
      .toString()
      .substring(0, 10);
  String secondDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .toString()
          .substring(0, 10);

  late OrderRepo orderRepo;
  RxList<OrderItemModel> orderItemList = RxList();



  OrderController() {
    print("this is order controllre");

    orderRepo = Get.put(OrderRepo());
  }

  ///for the order filter using date picker
  showDataPicker(context, int id) async {

   ;
    var result = await showDatePicker(
      context: context,
      initialDate: id == 1
          ? DateTime(DateTime.now().year, DateTime.now().month - 1)
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
  }




  getOrderItemList() {



    print("hahhaha");

   HttpGetResult<OrderItemModel> result = orderRepo.getOrderItem();

    orderItemList.addAll(result.mData);
    print(orderItemList);
  }






}
