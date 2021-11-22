import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/appbar/appbar_with_back_arrow.dart';
import 'package:whole_snack/features/edit_profile/controller/edit_profile_page_controller.dart';
import 'package:whole_snack/features/edit_profile/view/edit_profile_page_all_widget.dart';

class EditProfilePage extends StatelessWidget {


  final sizeConfig = Get.find<SizeConfig>();
  final controller = Get.find<EditProfilePageController>();

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return ScreenUtilInit(builder: () =>
    Scaffold(
      appBar: getAppBarWithBackArrow("Edit My Profile", sizeConfig, ()=>Get.back()),

      body: editProfilePageAllWidget(context, controller, sizeConfig),
    ));
  }
}
