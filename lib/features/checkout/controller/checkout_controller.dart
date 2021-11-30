import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/region_model.dart';

class CheckOutController extends GetxController{
  List<RegionModel> townshipList = [];
  RegionModel ? choosenValue;

  CheckOutController() {
    addTownshipAddress();
  }

  addTownshipAddress() {
    townshipList = <RegionModel>[
/*      RegionModel(id: 1, townshipName: "Amarapura"),
      RegionModel(id: 2, townshipName: "Aungmyaythazan"),
      RegionModel(id: 3, townshipName: "Amarapura"),
      RegionModel(id: 4, townshipName: "Chanayethazan"),
      RegionModel(id: 5, townshipName: "Chanmyathazi"),
      RegionModel(id: 6, townshipName: "Mahaaungmyay"),
      RegionModel(id: 7, townshipName: "Patheingyi"),
      RegionModel(id: 8, townshipName: "Pyigyidagun"),*/
    ];
  }


  changeDropDownValue(RegionModel model) {

    int index = townshipList.indexOf(model);
    choosenValue = townshipList[index];

    update();
  }
}