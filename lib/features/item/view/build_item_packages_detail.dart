import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/temp_data.dart';
import 'package:whole_snack/core/model/temp_model/temp_item_package_model.dart';
import 'package:whole_snack/features/item/controller/item_controller.dart';
import 'package:whole_snack/features/item/view/build_item_packages_detail_single_design.dart';

class BuildItemPackagesDetail extends StatelessWidget {
  const BuildItemPackagesDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ItemController mItemController = Get.find<ItemController>();

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return BuildItemPackagesDetailSingleDesign(
          index: index
        );
      },
      itemCount: mItemController.mItemDetailNoImage.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
