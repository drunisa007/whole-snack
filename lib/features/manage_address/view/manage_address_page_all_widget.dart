import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/manage_address/controller/manage_address_controller.dart';
import 'package:whole_snack/features/manage_address/view/build_address_list.dart';


class ManageAddressPageAllWidget extends StatelessWidget {
  const ManageAddressPageAllWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);
    ManageAddressController controller = Get.find<ManageAddressController>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: 16,),
        Flexible(child: BuildAddressList()),
        SizedBox(height: 16,),
        Center(
            child:GestureDetector(
              onTap: () => {
                Get.toNamed("/add-address-page"),
              },
              child: Container(
                height: mSizeConfig.blockSizeHorizontal * 10,
                width: mSizeConfig.blockSizeVertical*30,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Icon(Icons.add_circle,size: 22.sp,color: Theme.of(context).primaryColor,),
                    SizedBox(width: 16,),
                    Text(
                      "Add New Address",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: kExtraLargeFontSize15.sp,
                          fontWeight: FontWeight.w600),

                    )
                  ],
                ),
              ),
            )
        ),
        SizedBox(height: 16,),

      ],
    );
  }
}
