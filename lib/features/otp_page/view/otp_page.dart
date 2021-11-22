import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whole_snack/features/otp_page/view/build_otp_page_body.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: ()=> Scaffold(
      body: BuildOtpPageBody(),
    ));
  }
}
