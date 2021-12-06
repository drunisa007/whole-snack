import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/data_model/add_address_model.dart';
import 'package:whole_snack/core/model/data_model/region_model.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/build_custom_button.dart';
import 'package:whole_snack/features/add_address/controller/add_address_page_controller.dart';
import 'package:whole_snack/features/manage_address/controller/manage_address_controller.dart';

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

  var data = Get.arguments;
  TextEditingController addressController = TextEditingController();
  TextEditingController saveTittleController = TextEditingController();
  ManageAddressController manageAddressController = Get.find<ManageAddressController>();



  return  Obx(
    ()=> controller.townshipList.length==0? Center(child: CircularProgressIndicator(

      color: Theme.of(context).primaryColor,
    )) : ListView(
      children: [

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
              child: DropdownButton<RegionModel>(
                focusColor: Colors.white,
                value: controller.choosenValue,
                //elevation: 5,
                style: TextStyle(color: Colors.white),
                iconEnabledColor: Colors.black,
                items: controller.townshipList.value
                    .map<DropdownMenuItem<RegionModel>>((RegionModel value) {
                  return DropdownMenuItem<RegionModel>(
                    value: value,
                    child: Text(
                      value.regName,
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
                  //print(value);
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
            hintText: data != null &&data !=""?  data[1] : "Enter your address",
            hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: kLargeFontSize13.sp),
          ),
        ),
    /*    SizedBox(
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
        ),*/
        SizedBox(
          height: 16,
        ),
      BuildCustomButton(haveCorner: false, action: () async=> {



          showLoaderDialog(context),
          await controller.addNewAddress(AddAddressModel(cusId: "56", regId: controller.regionId, cusAddress: addressController.text)),

          Get.back(),


          Get.back(),
          manageAddressController.getMyAddress(),











        
        
      }, title: "Save Address")
      ],
    ),
  );

}
showLoaderDialog(context) {
  AlertDialog alert = AlertDialog(
    content:   Row(
      children: [
        CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ),
        Container(
            margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
      ],
    ),
  );
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {


      return  alert;
    },
  );
}