import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/township_model.dart';

class CheckOutController extends GetxController{
  List<TownshipModel> townshipList = [];
  TownshipModel ? choosenValue;

  CheckOutController() {
    addTownshipAddress();
  }

  addTownshipAddress() {
    townshipList = <TownshipModel>[
      TownshipModel(id: 1, townshipName: "Amarapura"),
      TownshipModel(id: 2, townshipName: "Aungmyaythazan"),
      TownshipModel(id: 3, townshipName: "Amarapura"),
      TownshipModel(id: 4, townshipName: "Chanayethazan"),
      TownshipModel(id: 5, townshipName: "Chanmyathazi"),
      TownshipModel(id: 6, townshipName: "Mahaaungmyay"),
      TownshipModel(id: 7, townshipName: "Patheingyi"),
      TownshipModel(id: 8, townshipName: "Pyigyidagun"),
    ];
  }


  changeDropDownValue(TownshipModel model) {

    int index = townshipList.indexOf(model);
    choosenValue = townshipList[index];

    update();
  }
}