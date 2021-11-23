import 'package:get/get.dart';

class CategoryController extends GetxController{

  RxInt selectedCategoryIndex = RxInt(0);

  changeCategoryIndex(int index){
    if(index!=selectedCategoryIndex.value){
      selectedCategoryIndex.value = index;
    }

  }

  RxInt selectedTypeIndex = RxInt(-1);

  changeTypeIndex(int index){
    selectedTypeIndex.value = index;
  }


}