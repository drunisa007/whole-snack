import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whole_snack/features/login_sign_up_main/view/build_login_sign_up_main_page_body.dart';

class LoginSignUpMainPage extends StatelessWidget {
  const LoginSignUpMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: ()=>
    Scaffold(

      body: BuildLoginSignUpMainPageBody(),
    ));
  }
}
