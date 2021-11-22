import 'package:flutter/material.dart';
import 'package:whole_snack/core/constants/temp_data.dart';
import 'package:whole_snack/core/model/temp_model/temp_item_package_model.dart';
import 'package:whole_snack/features/item/view/build_item_packages_detail_single_design.dart';

class BuildItemPackagesDetail extends StatelessWidget {
  const BuildItemPackagesDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TempItemPackageModel> mTempItemPackageList = zTempItemPackageList;

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return BuildItemPackagesDetailSingleDesign(
          quantity: mTempItemPackageList[index].quantity,
          price: mTempItemPackageList[index].price,
          index: index
        );
      },
      itemCount: mTempItemPackageList.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
