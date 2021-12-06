import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/order_detail_model.dart';
import 'package:whole_snack/core/model/data_model/order_info_model.dart';
import 'package:whole_snack/core/model/data_model/order_item_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/core/repos/order_detail_repo.dart';
import 'package:whole_snack/features/order/controller/order_controller.dart';

class OrderDetailPageController extends GetxController {
  late OrderDetailRepo _orderDetailRepo;
  RxList<OrderInfoModel> orderInfoList = RxList<OrderInfoModel>();
  RxList<OrderItemModel> orderItemList = RxList();

 late OrderController _orderController;


  OrderDetailPageController() {
    _orderDetailRepo = Get.put(OrderDetailRepo());



    getOrderDetailList(100);





    print("this is order detail page page Controller");
  }

  getOrderDetailList(int id) async {
    HttpGetResult<OrderDetailModel> result =
        await _orderDetailRepo.getOrderDetailById(id);

  orderInfoList.addAll(result.mData[0].ordersinfo);
   orderItemList.addAll(result.mData[0].orderItem);

   print(orderInfoList[0].ordPrice);




  }
}
