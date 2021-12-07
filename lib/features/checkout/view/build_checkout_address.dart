
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/data_model/region_model.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/add_address/controller/add_address_page_controller.dart';
import 'package:whole_snack/features/checkout/controller/checkout_controller.dart';


class BuildCheckOutAddress extends StatelessWidget {
  const BuildCheckOutAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);

    CheckOutController mCheckoutController = Get.find<CheckOutController>();


    TextEditingController saveTittleController = TextEditingController();

    AddAddressPageController mAddAddressController = Get.find<AddAddressPageController>();


    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(kDefaultMargin.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: kDefaultMargin.sp,),
          Text(
            "Phone Number",
            style: TextStyle(
              color: Color(0xff252837),
              fontWeight: FontWeight.w500,
              fontSize: kLargeFontSize13.sp,
            ),
          ),
          SizedBox(
            height: 6.sp,
          ),
          Container(
            height: mSizeConfig.safeBlockVertical*6,
            child: TextField(
              controller: mCheckoutController.phoneController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.sp),
                  borderSide: BorderSide(color: Color(0xffD2D5DB)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.sp),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                hintText: "Enter your phone number",
                hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: kLargeFontSize13.sp),
              ),
            ),
          ),
          SizedBox(height: kDefaultMargin.sp,),
          Text(
            "Township",
            style: TextStyle(
              color: Color(0xff252837),
              fontWeight: FontWeight.w500,
              fontSize: kLargeFontSize13.sp,
            ),
          ),
          SizedBox(
            height: 6.sp,
          ),
          GetBuilder<AddAddressPageController>(
            builder: (controller) => Container(
              padding: EdgeInsets.only(left: kDefaultMargin,right: kDefaultMargin),
              height: mSizeConfig.safeBlockVertical*6,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius:  BorderRadius.all(Radius.circular(4.sp)),
                border: Border.all(
                  color: Color(0xffD2D5DB),
                  width: 1,
                ),),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<RegionModel>(
                  focusColor: Colors.white,
                  value: controller.choosenValue,
                  //elevation: 5,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  items: controller.townshipList
                      .map<DropdownMenuItem<RegionModel>>((RegionModel value) {
                    return DropdownMenuItem<RegionModel>(
                      value: value,
                      child: Text(
                        value.regName,
                        style: TextStyle(color: Colors.black, fontSize: 12.sp),
                      ),
                    );
                  }).toList(),
                  hint: Text(
                    "Please Choose Your Region",
                    style: TextStyle(color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: kLargeFontSize13.sp),
                  ),
                  underline: Container(
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.transparent))),
                  ),
                  onChanged: (value) {
                    controller.changeDropDownValue(value!);
                    //print(value);
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: kDefaultMargin.sp,),
          Text(
            "Delivery Address",
            style: TextStyle(
              color: Color(0xff252837),
              fontWeight: FontWeight.w500,
              fontSize: kLargeFontSize13.sp,
            ),
          ),
          SizedBox(
            height: 6.sp,
          ),
          Container(
            height: mSizeConfig.safeBlockVertical*12,
            child: TextField(
              controller: mCheckoutController.addressController,
              maxLines: 6,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.sp),
                  borderSide: BorderSide(color: Color(0xffD2D5DB)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.sp),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                hintText: "Enter your address",
                hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: kLargeFontSize13.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
