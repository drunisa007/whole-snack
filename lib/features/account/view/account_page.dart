import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/appbar/simple_app_bar.dart';
import 'package:whole_snack/features/account/controller/account_controller.dart';
import 'package:whole_snack/features/account/view/account_page_all_widget.dart';
class AccountPage extends StatelessWidget {


  SizeConfig sizeConfig = Get.find<SizeConfig>();
  final controller = Get.find<AccountController>();
  @override
  Widget build(BuildContext context) {

    sizeConfig.init(context);
    return ScreenUtilInit(builder: ()=> Scaffold(

      appBar: getSimpleAppbar("Account", sizeConfig),

      body: accountPageAllWidget(context, controller, sizeConfig)
    )
    );
  }
}
