import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/order_detail_model.dart';
import 'package:whole_snack/core/model/data_model/order_info_model.dart';
import 'package:whole_snack/core/model/data_model/order_item_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/core/repos/order_detail_repo.dart';
import 'package:whole_snack/features/cart/controller/cart_controller.dart';
import 'package:whole_snack/features/order/controller/order_controller.dart';

class OrderDetailPageController extends GetxController {
  late OrderDetailRepo _orderDetailRepo;
  RxList<OrderInfoModel> orderInfoList = RxList<OrderInfoModel>();
  RxList<OrderItemModel> orderItemList = RxList();

  RxBool isLoading = true.obs;

 late OrderController _orderController;

 CartController mCartController = Get.find<CartController>();

 OrderController mOrderController = Get.find<OrderController>();


  OrderDetailPageController() {
    _orderDetailRepo = Get.put(OrderDetailRepo());


    if(mOrderController.mOrdId.value!= -1) {

      getOrderDetailList(mOrderController.mOrdId.value);
    }



    print("this is order detail page page Controller");
  }

  getOrderDetailList(int id) async {
    HttpGetResult<OrderDetailModel> result =
        await _orderDetailRepo.getOrderDetailById(id);

  orderInfoList.addAll(result.mData[0].ordersinfo);
   orderItemList.addAll(result.mData[0].orderItem);
   isLoading.value = false;






  }
}
