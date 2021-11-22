import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/edit_profile/controller/edit_profile_page_controller.dart';

Widget editProfilePageAllWidget(BuildContext context,
    EditProfilePageController controller, SizeConfig sizeConfig) {
  return _buildEditProfileBody(context, controller, sizeConfig);
}

Widget _buildEditProfileBody(BuildContext context,
    EditProfilePageController controller, SizeConfig sizeConfig) {
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
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Fullname",
                    style: TextStyle(
                        color: Colors.grey, fontSize: kLargeFontSize14.sp),
                  ),
                  TextField(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: kExtraLargeFontSize16.sp,
                        fontWeight: FontWeight.bold),
                    controller: nameController,
                    decoration: InputDecoration(
                        filled: true,
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: kExtraLargeFontSize16.sp,
                            fontWeight: FontWeight.bold),
                        hintText: "Kyaw Zin",
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
                  SizedBox (
                    width: double.infinity,
                    height: sizeConfig.blockSizeHorizontal * 10,
                    child: RaisedButton(
                        shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          "Update Profile",
                          style: TextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              fontSize: kExtraLargeFontSize16.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        color: Theme.of(context).primaryColor,
                        onPressed: () => Get.back()),
                  ),
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
