// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class HttpPostService {
//   late String baseUrl;
//   late String apiKey;
//
//   HttpPostService() {
//
//     initData();
//   }
//
//   ///this will use to send address data
//   Future<HttpResponse> postAddress(AddressModel addressModel) async {
//
//     var uri=  Uri.parse('$API_KEY/customer/address.php');
//     final response = await http.post(
//       uri,
//       headers: getHeader(),
//
// <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Authorization': 'Bearer ${getAPIBox()}',
//       },
//
//       body: jsonEncode(addressModel.toJson()));
//
//     if (response.statusCode == 200) {
//
//       print("success");
//       return HttpResponse('', 200, "", true);
//
//     } else {
//       // If the server did not return a 201 CREATED response,
//       // then throw an exception.
//       print(response.statusCode);
//
//       throw Exception('Failed to add address');
//     }
//   }
//   Future<HttpResponse> deleteAlbum(String id) async {
//
//     var uri =   Uri.parse('customer/deleteaddress.php?id=30');
//     final http.Response response = await http.delete(
//     uri,
//       headers: getHeader(),
//     );
//
//     if (response.statusCode == 200) {
//
//         print("success");
//       return HttpResponse('', 200, "", true);
//     } else {
//       // If the server did not return a "200 OK response",
//       // then throw an exception.
//       throw Exception('Failed to delete address.');
//     }
//   }
//
//   initData(){
//     baseUrl = "$API_KEY";
//     apiKey = "343434";
//   }
//   getHeader(){
//
//       return {
//         "Content-Type": "application/json",
//         'Authorization': 'Bearer ${getAPIBox()}'
//
//       };
//
//   }
// }
