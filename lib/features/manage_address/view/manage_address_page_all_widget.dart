import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/manage_address/controller/manage_address_controller.dart';

Widget manageAddressPageAllWidget(BuildContext context,SizeConfig sizeConfig, ManageAddressController controller) {


  return Column(
    children: [
      SizedBox(height: 8,),
      buildAddressList(context, sizeConfig, controller),
      SizedBox(height: 16,),
      buildAddressList(context, sizeConfig, controller),
      SizedBox(height: 16,),
      Center(
          child:GestureDetector(
            onTap: () => Get.toNamed("/add-address-page"),
            child: Container(
              height: sizeConfig.blockSizeHorizontal * 10,
              width: sizeConfig.blockSizeVertical*30,
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
                        fontSize: kExtraLargeFontSize16.sp,
                        fontWeight: FontWeight.w600),

                  )
                ],
              ),
            ),
          )
      ),

    ],
  );
}

Widget buildAddressList(BuildContext context,SizeConfig sizeConfig, ManageAddressController controller) {

  return Container(

    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,

    /*  border: Border.all(
        color: Colors.grey
      )*/
    ),
    child: Row(
      children: [

        Icon(Icons.place,size: 22.sp,color: Colors.grey,),
        SizedBox(width: 16,),
        Flexible(
          child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Home\n",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: kExtraLargeFontSize16.sp,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "45 E 45 St Mdy City Myamandalar ,Mandalay",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: kLargeFontSize14.sp,
                      )),
              ])),
        ),

        SizedBox(
          width: 8,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: ()=> print("hahhaha"),
              child: Text(
                  "Update",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: kLargeFontSize14.sp,
                  )),
            ),
            SizedBox(width: 8,),
            GestureDetector(
              onTap: ()=>print('hahahhahaha'),
              child: Text(
                  "Delete",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: kLargeFontSize14.sp,
                  )),
            ),
          ],
        ),



      ],
    ),
  );
}