import 'package:get/get.dart';
import 'package:whole_snack/core/repos/register_repo.dart';

class FeatureMainController extends GetxController{
  /// please list the variable with only applicable variable.

  /// main bottom navigation index login
  late RxInt currentIndex;
  FeatureMainController() {
      currentIndex = 0.obs;
    }

    changeIndex(int index) {
      currentIndex.value = index;
    }

    int getIndex() {
      return currentIndex.value;
    }


    /// 0 is loading state
    /// 1 is login page state
    /// 2 is main page state
    RxInt authPosition = 0.obs;

    @override
    void onInit() {
      super.onInit();
      // String data = getAuth();
      //
      // if(data=="fail"){
      //   authPosition.value =1;
      // }
      // else if(data=="success"){
      //   authPosition.value=2;
      // }
      // else{
      //   authPosition.value = 0;
      // }
    }
    //
    // changeAuthPosition(int position){
    //   authPosition.value = position;
    // }
    //
    // ///register route
    // RegisterRepo mRegisterRepo = Get.find<RegisterRepo>();
    //
    //  letsRegister() async {
    //    HttpRegisterResult result =  await mRegisterRepo.getRegister();
    //    if(result.isSuccessful){
    //     RegisterModel mModel = result.mData;
    //    // print(mModel.customer[0].token);
    //
    //     writeAuth();
    //     writeAPIKey(mModel.customer[0].token);
    //     writeCustomer(mModel.customer[0].cusId);
    //
    //     changeAuthPosition(2);
    //
    //    }
    //  }
}