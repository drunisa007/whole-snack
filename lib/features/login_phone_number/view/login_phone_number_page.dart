import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whole_snack/features/login_phone_number/view/build_login_phone_number_page_body.dart';

class LoginPhoneNumberPage extends StatelessWidget {
  const LoginPhoneNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: ()=>Scaffold(
      body: BuildLoginPhoneNumberPageBody(),
    ));
  }
}
