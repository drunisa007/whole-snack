import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/repos/helper/secure_storage_helper.dart';

class HttpService {
  late String baseUrl;
  late String apiKey;


  late SecureStorageHelper helper;

  late String token;

  HttpService() {

    initData();

  }

  Future<HttpCustomResponse> getLogin(uri) async {
    try {
      // ,headers: getHeader()
      var url = Uri.parse(baseUrl + uri);
      http.Response response =
          await http.get(url, headers: {"Authorization": "${token.toString()}"});
      if (response.statusCode == 200) {
        return HttpCustomResponse('', 200, response.body, true);
      } else {
        return HttpCustomResponse('Something went wrong', 400, [], false);
      }
    } on FormatException catch (_) {
      return HttpCustomResponse(
          'Something went wrong on server', 400, [], false);
    } on SocketException catch (_) {
      return HttpCustomResponse(
          'Something went wrong with internet', 400, [], false);
    } catch (e) {
      return HttpCustomResponse('Something went wrong', 400, '', false);
    }
  }

  Future<HttpCustomResponse> orderSubmit(uri, body) async {
    try {
      var url = Uri.parse(baseUrl + uri);
      //print("url is $url");

      http.Response response =
          await http.post(url, headers: getHeader(), body: jsonEncode(body));


      print("order reponse is ${response.statusCode}");

      if (response.statusCode == 200) {
        return HttpCustomResponse('', 200, response.body, true);
      } else {
        return HttpCustomResponse(
            'Something went wrong status code', response.statusCode, '', false);
      }
    } on FormatException catch (_) {
      return HttpCustomResponse(
          'Something went wrong on server', 400, "", false);
    } on SocketException catch (_) {
      return HttpCustomResponse(
          'Something went wrong with internet', 400, "", false);
    } catch (e) {
      print(e);
      return HttpCustomResponse('Something went wrong', 400, "", false);
    }
  }

  Future<HttpCustomResponse> getData(uri) async {
    try {
      var url = Uri.parse(baseUrl + uri);

      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        return HttpCustomResponse('', 200, response.body, true);
      } else {
        return HttpCustomResponse(
            'Something went wrong status code', response.statusCode, '', false);
      }
    } on FormatException catch (_) {
      return HttpCustomResponse(
          'Something went wrong on server', 400, [], false);
    } on SocketException catch (_) {
      return HttpCustomResponse(
          'Something went wrong with internet', 400, [], false);
    } catch (e) {
      return HttpCustomResponse('Something went wrong', 400, [], false);
    }
  }

  Future<HttpCustomResponse> getDataWithHeader(uri) async {
    try {
      // ,headers: getHeader()
      var url = Uri.parse(baseUrl + uri);
      http.Response response = await http.get(url, headers: getHeader());

      print("response is address $response");

      // http.Response response  = await http.get(url);
      if (response.statusCode == 200) {
        return HttpCustomResponse('', 200, response.body, true);
      } else {
        return HttpCustomResponse(
            'Something went wrong status code', response.statusCode, '', false);
      }
    } on FormatException catch (_) {
      return HttpCustomResponse(
          'Something went wrong on server', 400, [], false);
    } on SocketException catch (_) {
      return HttpCustomResponse(
          'Something went wrong with internet', 400, [], false);
    } catch (e) {
      return HttpCustomResponse('Something went wrong', 400, [], false);
    }
  }

  Future<HttpCustomResponse> getDataWithJson(uri) async {
    try {
      var url = Uri.parse(uri);
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        return HttpCustomResponse('', 200, response.body, true);
      } else {
        return HttpCustomResponse('Something went wrong', 400, [], false);
      }
    } on FormatException catch (_) {
      return HttpCustomResponse(
          'Something went wrong on server', 400, [], false);
    } on SocketException catch (_) {
      return HttpCustomResponse(
          'Something went wrong with internet', 400, [], false);
    } catch (e) {
      return HttpCustomResponse('Something went wrong', 400, [], false);
    }
  }

  initData() async {
    baseUrl = "$API";
    helper = Get.put(SecureStorageHelper());
    dynamic mToken = await helper.readSecureData(key: TOKEN_KEY);
    token = mToken.toString();
  }

  getHeader() {
    print("header token is $token");
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token.toString()}"
    };
  }

/*  getHeader(){
    var langCode =  getLanguageCode();
   List<LanguageModel> mList = LanguageUtil().getLanguage();
   if(langCode.isNotEmpty){
     return {
       "Content-Type": "application/json",
       "Accept": "application/json",
       "Content-Language":"${mList[int.parse(langCode)].fullCode[0]}"
     };
   }


  }*/

}
