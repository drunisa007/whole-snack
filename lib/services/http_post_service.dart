import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/data_model/address_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';

class HttpPostService {
  late String baseUrl;
  late String apiKey;
  late String mName;
  late String mPhone;

  HttpPostService() {
    initData();
  }

  ///this will use to send address data
  Future<HttpCustomResponse> postAddress(AddressModel addressModel) async {
    var uri = Uri.parse('$API/customer/address.php');
    final response = await http.post(uri,
        headers: getHeader(), body: jsonEncode(addressModel.toJson()));

    if (response.statusCode == 200) {
      print("success");
      return HttpCustomResponse('', 200, "", true);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print(response.statusCode);

      throw Exception('Failed to add address');
    }
  }

  Future<HttpCustomResponse> deleteAlbum(String id) async {
    var uri = Uri.parse('customer/deleteaddress.php?id=30');
    final http.Response response = await http.delete(
      uri,
      headers: getHeader(),
    );

    if (response.statusCode == 200) {
      print("success");
      return HttpCustomResponse('', 200, "", true);
    } else {
      // If the server did not return a "200 OK response",
      // then throw an exception.
      throw Exception('Failed to delete address.');
    }
  }

  initData() {
    baseUrl = "$API";
    apiKey = "343434";
  }

  getHeader() {
    return {
      "Content-Type": "application/json",
      'Authorization': 'Bearer {getAPIBox()}'
    };
  }

  Future<HttpCustomResponse> register(String name, String phoneNumber) async {
    mName = name;
    mPhone = phoneNumber;
    var uri = Uri.parse('$API/customer/register.php');
    final response = await http.post(uri,
        headers: getHeader(),
        body: jsonEncode({"name": "$name", "phone": "$phoneNumber"}));

    if (response.statusCode == 200) {
      print(response.statusCode);
      return HttpCustomResponse('', response.statusCode, response.body, true);
    } else {
      print(response.statusCode);
      return HttpCustomResponse('', response.statusCode, [], false);
      print(response.statusCode);
    }
  }

  Future<HttpCustomResponse> sendOtp(
      String name, String phone, String otp) async {
    var uri = Uri.parse('https://seinwholesale.com/api/customer/verify.php');
    final response = await http.post(uri,
        headers: getHeader(),
        body: jsonEncode(
            {"name": "$name", "phone": "$phone", "otp": "$otp"}
            ));

    if (response.statusCode == 200) {
      print(response.statusCode);
      return HttpCustomResponse('', response.statusCode, response.body, true);
    } else {
      print(response.statusCode);
      return HttpCustomResponse('', response.statusCode, [], false);
      print(response.statusCode);
    }
  }
}
