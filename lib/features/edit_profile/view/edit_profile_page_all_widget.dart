import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/build_custom_button.dart';
import 'package:whole_snack/features/edit_profile/controller/edit_profile_page_controller.dart';

Widget editProfilePageAllWidget(BuildContext context,
    EditProfilePageController controller, SizeConfig sizeConfig) {
  return _buildEditProfileBody(context, controller, sizeConfig);
}

Widget _buildEditProfileBody(BuildContext context,
    EditProfilePageController controller, SizeConfig sizeConfig) {

  String data = Get.arguments;
  TextEditingController nameController = TextEditingController();
  return Container(
    height: double.infinity,
    width: double.infinity,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          height: sizeConfig.blockSizeHorizontal * 65,
          top: sizeConfig.blockSizeHorizontal * 18,
          left: 0,
          right: 0,
          child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(kDefaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Fullname",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary, fontSize: kMediumFontSize12.sp),
                  ),
                  TextField(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: kLargeFontSize14.sp,
                        fontWeight: FontWeight.bold),
                    controller: nameController,
                    decoration: InputDecoration(
                        filled: true,
                        hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: kLargeFontSize14.sp,
                            fontWeight: FontWeight.bold),
                        hintText: "$data",
                        fillColor: Colors.grey.withOpacity(0.1),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    height: 16,
                  ),
     BuildCustomButton(haveCorner: false, action: ()=>Get.back(), title: "Update Profile"),
                  SizedBox(
                    height: 16,
                  ),
                ],
              )),
        ),
        Positioned(
          height: sizeConfig.blockSizeHorizontal * 18,
          top: sizeConfig.blockSizeHorizontal * 8,
          child:ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset("assets/images/profile.jpg",fit: BoxFit.fill,  height: sizeConfig.blockSizeHorizontal * 18, width: sizeConfig.blockSizeHorizontal * 18,)),
        ),
        Positioned(
            height: sizeConfig.blockSizeHorizontal * 6,
            top: sizeConfig.blockSizeHorizontal * 17,
            left: sizeConfig.blockSizeVertical * 9,
            right: sizeConfig.blockSizeVertical * 1,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              radius: 30,

              child: Icon(
                Icons.add,
                size: 24 .sp,
                color: Colors.white,
              ),
            ))
      ],
    ),
  );
}
