import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/appbar/appbar_with_back_arrow.dart';
import 'package:whole_snack/core/widgets/appbar/simple_app_bar.dart';
import 'package:whole_snack/features/about_page/controller/about_page_controller.dart';
import 'package:whole_snack/features/about_page/view/about_page_all_widget.dart';

class AboutPage extends StatelessWidget {


  SizeConfig sizeConfig = Get.find<SizeConfig>();
  final controller = Get.find<AboutPageController>();
  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return ScreenUtilInit(builder: () => Scaffold(
      appBar: getAppBarWithBackArrow("About Page", sizeConfig, ()=>Get.back()),

      body: AboutPageAllWidget(sizeConfig : sizeConfig,controller :  controller)
    ));
  }
}
