import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/data_model/township_model.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/build_custom_button.dart';
import 'package:whole_snack/features/add_address/controller/add_address_page_controller.dart';

Widget addAddressPageAllWidget(BuildContext context, SizeConfig sizeConfig,
    AddAddressPageController controller) {
  return Padding(
    padding: const EdgeInsets.all(kDefaultMargin),
    child: _buildAddAddressForm(context, sizeConfig, controller),
  );
}

Widget _buildAddAddressForm(BuildContext context, SizeConfig sizeConfig,
    AddAddressPageController controller) {
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController saveTittleController = TextEditingController();

  return ListView(
    children: [
      Text(
        "Phone Number",
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: kLargeFontSize13.sp,

            fontWeight: FontWeight.w500
        ),
      ),
      SizedBox(
        height: 8,
      ),
      TextField(
        controller: phoneController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide( color: Theme.of(context).colorScheme.onPrimary, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onPrimary
            ),
          ),
          hintText: "Enter you address",
          hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: kLargeFontSize13.sp),
        ),
      ),
      SizedBox(
        height: 12,
      ),
      Text(
        "Township",
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: kLargeFontSize13.sp,
          fontWeight: FontWeight.w500
        ),
      ),
      SizedBox(
        height: 8,
      ),
      GetBuilder<AddAddressPageController>(
        builder: (controller) => Container(

          padding: EdgeInsets.only(left: kDefaultMargin,right: kDefaultMargin),

          decoration: BoxDecoration(
           

            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(
              color: Theme.of(context).colorScheme.onPrimary,

              width: 1,
            ),),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<TownshipModel>(
              focusColor: Colors.white,
              value: controller.choosenValue,
              //elevation: 5,
              style: TextStyle(color: Colors.white),
              iconEnabledColor: Colors.black,
              items: controller.townshipList
                  .map<DropdownMenuItem<TownshipModel>>((TownshipModel value) {
                return DropdownMenuItem<TownshipModel>(
                  value: value,
                  child: Text(
                    value.townshipName,
                    style: TextStyle( color: Theme.of(context).colorScheme.secondary, fontSize: kLargeFontSize13.sp),
                  ),
                );
              }).toList(),
              hint: Text(
                "Please Choose Your Region\t \t \t\t",
                style: TextStyle( color: Theme.of(context).colorScheme.onPrimary, fontSize: kLargeFontSize13.sp),
              ),
              underline: Container(
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.transparent))),
              ),
              onChanged: (value) {
                controller.changeDropDownValue(value!);
                print(value);
              },
            ),
          ),
        ),
      ),
      SizedBox(
        height: 12,
      ),
      Text(
        "Delivery Addresss",
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: kLargeFontSize13.sp,
          fontWeight: FontWeight.w500
        ),
      ),
      SizedBox(
        height: 8,
      ),
      TextField(
        controller: addressController,
        maxLines: 3,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onPrimary
            ),
          ),
          hintText: "Enter your address",
          hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: kLargeFontSize13.sp),
        ),
      ),
      SizedBox(
        height: 12,
      ),
      Text(
        "Save As",
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: kLargeFontSize13.sp,
        ),
      ),
      SizedBox(
        height: 8,
      ),
      TextField(
        controller: saveTittleController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onPrimary
            ),
          ),
          hintText: "Home",
          hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: kLargeFontSize13.sp),
        ),
      ),
      SizedBox(
        height: 16,
      ),
    BuildCustomButton(haveCorner: false, action: ()=>Get.back(), title: "Save Address")
    ],
  );
}
