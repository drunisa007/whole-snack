import 'package:whole_snack/core/model/data_model/item_model.dart';

class CategoryItemListModel {
  List<ItemModel> mItemList = [];
  String itemErrorMessage = "";
  bool itemLoading = true;
  int totalPage = 1;
  int currentPage = 1;
  bool onLoad = false;
  String title;

  CategoryItemListModel(
      {required this.mItemList,
      required this.itemErrorMessage,
      required this.itemLoading,
      required this.totalPage,
      required this.currentPage,
      required this.title,
      required this.onLoad});
}
