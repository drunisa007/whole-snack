import 'package:whole_snack/core/model/data_model/township_model.dart';

class AddressModel {

  String saveName;
  String address;
  String phone;
  TownshipModel townshipModel;

  AddressModel({required this.saveName, required this.address, required this.phone, required this.townshipModel});
}