import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/features/manage_address/controller/manage_address_controller.dart';

class BuildAddressList extends StatelessWidget {
  const BuildAddressList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ManageAddressController mManageAddressController =
        Get.find<ManageAddressController>();

    return Obx(() {
      return mManageAddressController.loading.isTrue
          ? CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            )
          : mManageAddressController.loading.isFalse &&
                  mManageAddressController.errorMessage.value.isNotEmpty
              ? Center(
                  child: Text(mManageAddressController.errorMessage.value),
                )
              : ListView.builder(
                  itemCount: mManageAddressController.addressList.length,
                  itemBuilder: (context, int index) {
                    return Container(
                        padding: EdgeInsets.all(kDefaultMargin.sp),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.place,
                              size: 22.sp,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              flex: 10,
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text:
                                        "${mManageAddressController.addressList[index].regName} \n",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: kLargeFontSize13.sp,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text:
                                        "${mManageAddressController.addressList[index].cusAddress}",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      fontSize: kMediumFontSize12.sp,
                                    )),
                              ])),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () async => {
                                mManageAddressController.deleteAddress(
                                    mManageAddressController
                                        .addressList[index].cusAddressId)
                              },
                              child: Text("Delete ",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: kSmallFontSize10.sp,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ));
                  },
                );
    });
  }
}
