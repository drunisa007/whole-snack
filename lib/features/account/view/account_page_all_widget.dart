import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/account/controller/account_controller.dart';

Widget accountPageAllWidget(
    BuildContext context, AccountController controller, SizeConfig sizeConfig) {
  bool isArrow = true;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
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
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: _buildSubSettinList(context, controller, sizeConfig,
                Icons.logout, "Log Out", () => Get.toNamed("/order-success-page"), !isArrow)),
        SizedBox(
          height: 16,
        ),
        Center(
          child: Text("Daily v.1.0.1(10)",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: kLargeFontSize14.sp,
                  fontWeight: FontWeight.w500)),
        ),

        Spacer(),
        Center(
          child: Text("Reach out to Us",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: kExtraLargeFontSize16.sp,
                  fontWeight: FontWeight.w500)),
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
    ),
  );
}

///Build profile widget
Widget _buildProfileWidget(
    BuildContext context, AccountController controller, SizeConfig sizeConfig) {
  return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),

            child: Image.asset("assets/images/profile.jpg",height: sizeConfig.blockSizeHorizontal*10,
            width: sizeConfig.blockSizeHorizontal*10,
            fit: BoxFit.cover,)
          ),
          SizedBox(
            width: 16,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                  text: "Kyaw Zin Latt\n",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: kExtraLargeFontSize16.sp,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: "09972000283",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: kLargeFontSize14.sp,
                    fontWeight: FontWeight.w500)),
          ])),
          Spacer(),
          GestureDetector(
            onTap: () => Get.toNamed("/edit-profile-page"),
            child: Text("Edit",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: kLargeFontSize14.sp,
                    fontWeight: FontWeight.w500)),
          ),
        ],
      ));
}

Widget _buildSetting(
    BuildContext context, AccountController controller, SizeConfig sizeConfig) {
  bool isArrow = true;

  List<Widget> settingList = [
    _buildSubSettinList(context, controller, sizeConfig, Icons.room,
        "Manage Address", () =>Get.toNamed("/manage-address-page"), isArrow),
    Divider(),
    _buildSubSettinList(context, controller, sizeConfig, Icons.headset_mic,
        "Customer Support", () => Get.toNamed("/customer-support-page"), isArrow),
    Divider(),
    _buildSubSettinList(context, controller, sizeConfig, Icons.info,
        "About Daily", () => Get.toNamed("/about-page"), isArrow),
  ];

  return Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
    child: Column(
      children: settingList.map((e) => e).toList(),
    ),
  );
}

Widget _buildSubSettinList(
    BuildContext context,
    AccountController controller,
    SizeConfig sizeConfig,
    IconData icon,
    String title,
    Function onClick,
    bool isArrow) {
  return GestureDetector(
    onTap: () =>onClick(),

    child: Row(
      children: [
        Icon(
          icon,
          size: 24.sp,
        ),
        SizedBox(
          width: 8,
        ),
        Text(title,
            style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: kLargeFontSize14.sp,
                fontWeight: FontWeight.w500)),
        Spacer(),
        isArrow ? Icon(Icons.navigate_next,size: 24.sp,color: Colors.black.withOpacity(0.5),) : Text("")
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
