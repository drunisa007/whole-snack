import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  String firstDate = DateTime(
          DateTime.now().year, DateTime.now().month - 1, DateTime.now().day)
      .toString()
      .substring(0, 10);
  String secondDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .toString()
          .substring(0, 10);

  OrderController() {
    print("this is order controllre");
  }

  ///for the order filter using date picker
  showDataPicker(context, int id) async {
    var result = await showDatePicker(
      context: context,
      initialDate: id==1? DateTime(DateTime.now().year, DateTime.now().month - 1)
          : DateTime(DateTime.now().year, DateTime.now().month) ,
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


  dateCompare() {


  }
}
