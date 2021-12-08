import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/account/controller/account_controller.dart';

Widget accountPageAllWidget(
    BuildContext context, AccountController controller, SizeConfig sizeConfig) {
  bool isArrow = true;
  return Column(
    children: [
      _buildProfileWidget(context, controller, sizeConfig),
      SizedBox(
        height: 8,
      ),
      _buildSetting(context, controller, sizeConfig),
      SizedBox(
        height: 16,
      ),
      Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: kDefaultMargin, vertical: 16),
          child: _buildSubSettinList(context, controller, sizeConfig,
              "assets/images/logout.svg", "Log Out", () => {


            controller.logout(),

              }, !isArrow)),
      SizedBox(
        height: 16,
      ),
      Center(
        child: Text("Daily v.1.0.1(10)",
            style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: kSmallFontSize10.sp,
                fontWeight: FontWeight.w500)),
      ),

      Spacer(),
      Center(
        child: Text("Reach out to Us",
            style: TextStyle(
                color: Colors.black,
                fontSize: kLargeFontSize14.sp,
                fontWeight: FontWeight.bold)),
      ),
      SizedBox(
        height: 12,
      ),
      _buildSocialButtonList(
        context,
        controller,
        sizeConfig,
      )
    ],
  );
}

///Build profile widget
Widget _buildProfileWidget(
    BuildContext context, AccountController controller, SizeConfig sizeConfig) {
  return Container(
      color: Colors.white,
      padding: EdgeInsets.all(kDefaultMargin),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(100),

              child: Image.asset("assets/images/profile.jpg",height: sizeConfig.blockSizeHorizontal*12,
                width: sizeConfig.blockSizeHorizontal*12,
                fit: BoxFit.cover,)
          ),
          SizedBox(
            width: 16,
          ),
          Obx(
              ()=>controller.token==null?GestureDetector(
                  onTap: () {

                    controller.checkoutCheckStatus();
                  },
                  child: Text('Sign in',style: TextStyle(fontWeight: FontWeight.w600,color: Theme.of(context).primaryColor),)) :   RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "${controller.myProfile[0].cusName}\n",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: kExtraLargeFontSize16.sp,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: "${controller.myProfile[0].cusPhone}",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: kMediumFontSize12.sp,
                          )),
                ]))
          ),
          Spacer(),
          GestureDetector(
            onTap: () => {

            controller.checkoutCheckStatus()
            },
            child: Text("Edit",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: kLargeFontSize14.sp,
                    fontWeight: FontWeight.w600)),
          ),
        ],
      ));
}

Widget _buildSetting(
    BuildContext context, AccountController controller, SizeConfig sizeConfig) {
  bool isArrow = true;

  List<Widget> settingList = [
    _buildSubSettinList(context, controller, sizeConfig, "assets/images/location_icon.svg",
        "Manage Address", () =>{

      controller.checkoutCheckStatus()
        }, isArrow),
    Divider(),
    _buildSubSettinList(context, controller, sizeConfig, "assets/images/head_phone.svg",
        "Customer Support", () => Get.toNamed("/customer-support-page"), isArrow),
    Divider(),
    _buildSubSettinList(context, controller, sizeConfig,"assets/images/about.svg",
        "About Daily", () => Get.toNamed("/about-page"), isArrow),
  ];

  return Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: kDefaultMargin, vertical: 16),
    child: Column(
      children: settingList.map((e) => e).toList(),
    ),
  );
}

Widget _buildSubSettinList(
    BuildContext context,
    AccountController controller,
    SizeConfig sizeConfig,
    String icon,
    String title,
    Function onClick,
    bool isArrow) {
  return InkWell(
    onTap: ()=>onClick(),
    child: Row(
      children: [
       SvgPicture.asset(
            icon,
            width: 20.sp,
            height: 20.sp,
            color: Theme.of(context).colorScheme.secondary
        ),
        SizedBox(
          width: 8,
        ),
        Text(title,
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: kLargeFontSize13.sp,
                fontWeight: FontWeight.w500)),
        Spacer(),
        isArrow ? Icon(Icons.navigate_next,size: 24.sp,color: Theme.of(context).colorScheme.secondary,) : Text("")
      ],
    ),
  );
}

Widget _buildSocialButtonList(
    BuildContext context,
    AccountController controller,
    SizeConfig sizeConfig,
    ) {
  List<Widget> socialButtons = [
    _buildSocialButton(context, controller, sizeConfig,
        "assets/images/viber.png", () => print("hahhaha")),
    _buildSocialButton(context, controller, sizeConfig,
        "assets/images/messenger.png", () => print("hahhaha")),
    _buildSocialButton(context, controller, sizeConfig,
        "assets/images/facebook.png", () => print("hahhaha")),
    _buildSocialButton(context, controller, sizeConfig,
        "assets/images/email.png", () => print("hahhaha")),
  ];
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: socialButtons.map((e) => e).toList(),
  );
}

Widget _buildSocialButton(BuildContext context, AccountController controller,
    SizeConfig sizeConfig, String imagePath, Function function) {
  return Container(
    padding: EdgeInsets.only(right: 12),
    height: sizeConfig.blockSizeHorizontal * 12,
    width: sizeConfig.blockSizeHorizontal * 12,
    decoration: BoxDecoration(shape: BoxShape.circle),
    child: Image.asset(
      imagePath,
      fit: BoxFit.fitWidth,
    ),
  );
}