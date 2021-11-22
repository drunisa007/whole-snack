import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whole_snack/features/sign_up_page/view/build_sing_up_page_body.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: ()=> Scaffold(
      body: BuildSignUpPageBody(),
    ));
  }
}
