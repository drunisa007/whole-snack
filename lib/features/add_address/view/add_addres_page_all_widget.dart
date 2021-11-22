import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/data_model/township_model.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/add_address/controller/add_address_page_controller.dart';

Widget addAddressPageAllWidget(BuildContext context, SizeConfig sizeConfig,
    AddAddressPageController controller) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
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
          color: Colors.black,
          fontSize: kLargeFontSize14.sp,
        ),
      ),
      TextField(
        controller: phoneController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          hintText: "Enter you address",
          hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.8),
              fontSize: kMediumFontSize12.sp),
        ),
      ),
      SizedBox(
        height: 8,
      ),
      Text(
        "Delivery Addresss",
        style: TextStyle(
          color: Colors.black,
          fontSize: kLargeFontSize14.sp,
        ),
      ),
      GetBuilder<AddAddressPageController>(
        builder: (controller) => Container(

          padding: EdgeInsets.only(left: 8,right: 8),

          decoration: BoxDecoration(
           

            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(
              color: Colors.grey,

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
                    style: TextStyle(color: Colors.black, fontSize: 12.sp),
                  ),
                );
              }).toList(),
              hint: Text(
                "Please Choose Your Region\t \t \t\t",
                style: TextStyle(color: Colors.grey, fontSize: 12.sp),
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
        height: 8,
      ),
      Text(
        "Delivery Addresss",
        style: TextStyle(
          color: Colors.black,
          fontSize: kLargeFontSize14.sp,
        ),
      ),
      TextField(
        controller: addressController,
        maxLines: 3,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          hintText: "Enter your address",
          hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: kMediumFontSize12.sp),
        ),
      ),
      SizedBox(
        height: 8,
      ),
      Text(
        "Save As",
        style: TextStyle(
          color: Colors.black,
          fontSize: kLargeFontSize14.sp,
        ),
      ),
      TextField(
        controller: saveTittleController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          hintText: "Home",
          hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.8),
              fontSize: kMediumFontSize12.sp),
        ),
      ),
      SizedBox(
        height: 16,
      ),
      SizedBox(
        width: double.infinity,
        height: sizeConfig.blockSizeHorizontal * 10,
        child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Text(
              "Save Address",
              style: TextStyle(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  fontSize: kExtraLargeFontSize16.sp,
                  fontWeight: FontWeight.w600),
            ),
            color: Theme.of(context).primaryColor,
            onPressed: () => print("hahahah")),
      ),
    ],
  );
}
