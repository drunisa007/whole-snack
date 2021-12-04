// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:whole_snack/core/constants/default_values.dart';
// import 'package:whole_snack/core/model/temp_model/temp_item_model.dart';
// import 'package:whole_snack/core/utils/size_config.dart';
// import 'package:whole_snack/core/widgets/build_item_single_grid.dart';
// import 'package:whole_snack/features/category/controller/category_controller.dart';
// import 'package:whole_snack/features/category/view/build_item_type_single_shimmer.dart';
// import 'package:whole_snack/features/home/controller/home_controller.dart';
//
// class BuildItemTypeSingleDesign extends StatelessWidget {
//   final String itemTypeTitle;
//
//   const BuildItemTypeSingleDesign({
//     Key? key,
//     required this.itemTypeTitle,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     RefreshController _refreshController =
//         RefreshController(initialRefresh: false);
//     CategoryController mCategoryController = Get.find<CategoryController>();
//
//     void _onRefresh() async {
//       mCategoryController.onLoad.value = false;
//       if (mCategoryController.selectedTypeId.isNotEmpty) {
//         await mCategoryController.fetchingItemList(
//             mCategoryController.mainCategoryId.value, false,
//             typeId: mCategoryController.selectedTypeId.value);
//       } else {
//         await mCategoryController.fetchingItemList(
//             mCategoryController.mainCategoryId.value, false);
//       }
//       _refreshController.refreshCompleted();
//     }
//
//     void _onLoading() async {
//       mCategoryController.onLoad.value = true;
//       if (mCategoryController.selectedTypeId.isNotEmpty) {
//         await mCategoryController.fetchingItemList(
//             mCategoryController.mainCategoryId.value, true,
//             typeId: mCategoryController.selectedTypeId.value);
//       } else {
//         await mCategoryController.fetchingItemList(
//             mCategoryController.mainCategoryId.value, true);
//       }
//
//       _refreshController.loadComplete();
//     }
//
//     // return  ListView.builder(itemBuilder: (context,index){
//     //   return Text("fuck you");
//     // },
//     //   physics: ClampingScrollPhysics(),
//     // itemCount: 30,
//     //   shrinkWrap: true,
//     // );
//
//     SizeConfig mSizeConfig = Get.find<SizeConfig>();
//
//     return ListView(
//       children: [
//         SizedBox(height: 4.sp,),
//         Text(itemTypeTitle),
//         SizedBox(height: 10.sp,),
//         ListView(
//           children: [
//             Container(
//               width: double.infinity,
//               height: mSizeConfig.safeBlockVertical * 50 - kToolbarHeight,
//               child: Obx(() {
//                 return mCategoryController.itemLoading.isTrue &&
//                         mCategoryController.onLoad.isFalse
//                     ? BuildItemTypeSingleShimmer()
//                     : SmartRefresher(
//                         enablePullDown: true,
//                         enablePullUp: true,
//                         header: GetPlatform.isAndroid
//                             ? WaterDropMaterialHeader()
//                             : WaterDropHeader(),
//                         footer: CustomFooter(
//                           builder: (BuildContext context, LoadStatus? mode) {
//                             Widget body;
//                             if (mode == LoadStatus.idle) {
//                               body = Text("pull up load");
//                             } else if (mode == LoadStatus.loading) {
//                               body = GetPlatform.isAndroid
//                                   ? CircularProgressIndicator()
//                                   : CupertinoActivityIndicator();
//                             } else if (mode == LoadStatus.failed) {
//                               body = Text("Load Failed!Click retry!");
//                             } else if (mode == LoadStatus.canLoading) {
//                               body = Text("release to load more");
//                             } else {
//                               body = Text("No more Data");
//                             }
//
//                             return Container(
//                               height: 50.0.sp,
//                               child: Center(child: body),
//                             );
//                           },
//                         ),
//                         controller: _refreshController,
//                         onRefresh: _onRefresh,
//                         onLoading: _onLoading,
//                         child: GridView.builder(
//                           gridDelegate:
//                               SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 2,
//                                   childAspectRatio: 1 / 1.25),
//                           itemCount: mCategoryController.mItemList.length,
//                           shrinkWrap: true,
//                           itemBuilder: (context, index) {
//                             return BuildItemSingleGrid(
//                               currentIndex: index,
//                             );
//                           },
//                         ));
//               }),
//             )
//           ],
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//         )
//       ],
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//     );
//   }
// }
