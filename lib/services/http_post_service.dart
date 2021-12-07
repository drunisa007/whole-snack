import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/data_model/add_address_model.dart';
import 'package:whole_snack/core/model/data_model/address_model.dart';
import 'package:whole_snack/core/model/data_model/order_date_filter_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';

class HttpPostService {
  late String baseUrl;
  late String apiKey;
  late String mName;
  late String mPhone;
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IjA5Nzg1ODgyMzgxIiwiZXhwIjoxNjY4NTY5Nzk2fQ.XHJLaHuVBHG44fQSJJjVgXlWP2NlzsvBt67sfK0k8iY";

  HttpPostService() {
    initData();
  }

  ///this will use to send address data
  Future<HttpCustomResponse> postAddress(
      AddAddressModel addAddressModel) async {
    var uri = Uri.parse('$API/customer/address.php');
    final response = await http.post(uri,
        headers: getHeader(), body: jsonEncode(addAddressModel.toJson()));

    if (response.statusCode == 200) {
     // print("success");
      return HttpCustomResponse('', 200, "", true);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
     // print(response.statusCode);

      throw Exception('Failed to add address');
    }
  }

  /*Future<HttpCustomResponse> deleteAddress(String id) async {
    var uri = Uri.parse('$API/customer/deleteaddress.php?id=$id');
    final response = await http.delete(uri,
        headers: getHeader(), body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      //print(response.statusCode);
      return HttpCustomResponse('', response.statusCode, response.body, true);
    } else {
      //print(response.statusCode);
      return HttpCustomResponse('', response.statusCode, [], false);
      print(response.statusCode);
    }
  }*/

  initData() {
    baseUrl = "$API";
    apiKey = "343434";
  }

  getHeader() {
    return {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token'
    };
  }

  Future<HttpCustomResponse> register(String name, String phoneNumber) async {
    mName = name;
    mPhone = phoneNumber;

    var uri = Uri.parse('$API/customer/userregister.php');
    final response = await http.post(uri,
        headers: getHeader(),
        body: jsonEncode({"name": "$name", "phone": "$phoneNumber",}));

    if (response.statusCode == 200) {
      //print(response.statusCode);
      return HttpCustomResponse('', response.statusCode, response.body, true);
    } else {
      //print(response.statusCode);
      return HttpCustomResponse('', response.statusCode, [], false);
      print(response.statusCode);
    }
  }

  Future<HttpCustomResponse> sendOtp(
      String name, String phone, String otp) async {
    //print("name $name phone $phone $otp is otp");
    print(jsonEncode(jsonEncode({"name": "$name", "phone": "$phone", "otp": "$otp"})));
    var uri = Uri.parse('https://seinwholesale.com/api/customer/verify.php');
    final response = await http.post(uri,
        // headers: getHeader(),
        body: jsonEncode({"name": "$name", "phone": "$phone", "otp": "$otp"}));

    print(response.body);
    if (response.statusCode == 200) {
      //print(response.statusCode);
      return HttpCustomResponse('', response.statusCode, response.body, true);
    } else {
      //print(response.statusCode);
      return HttpCustomResponse('', response.statusCode, [], false);
      print(response.statusCode);
    }
  }

  ///get order list by date filter
  Future<HttpCustomResponse> getOrderByDate(OrderDateFilterModel model) async {
    var uri = Uri.parse('$API/order/orderfilter.php');
    final response = await http.post(uri,
        headers: getHeader(), body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      //print(response.statusCode);
      return HttpCustomResponse('', response.statusCode, response.body, true);
    } else {
     // print(response.statusCode);
      return HttpCustomResponse('', response.statusCode, [], false);
      print(response.statusCode);
    }
  }
}
