import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/region_model.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/core/repos/get_all_region_repo.dart';

class AddAddressPageController extends GetxController {
 RxList<RegionModel> townshipList = RxList();
 RegionModel ? choosenValue;
 GetAllRegionRepo getAllRegion= Get.put(GetAllRegionRepo());

  AddAddressPageController() {




    addTownshipAddress();
  }

  addTownshipAddress() async  {

    HttpGetResult<RegionModel>  regionResult = await getAllRegion.getTownshipList();

    townshipList.addAll(regionResult.mData);

    update();
  }


  changeDropDownValue(RegionModel model) {

   int index = townshipList.indexOf(model);
   choosenValue = townshipList[index];
   print('hahahah $choosenValue');



    update();
  }
}
