import 'dart:io';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerSupportPageController extends GetxController {

  CustomerSupportPageController() {

    print("This is customer suppoet page Controller");
  }

  Future<void> launchLinks(String contactNumber) async {
    final Uri _phoneUri = Uri(
        scheme: "tel",
        path: contactNumber
    );

    try {
      if (await canLaunch(_phoneUri.toString()))
        await launch(_phoneUri.toString());
    } catch (error) {
      throw(error.toString());
    }
  }


}