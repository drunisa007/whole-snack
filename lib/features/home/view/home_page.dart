import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/appbar/custom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);

    double appBarHeight = mSizeConfig.blockSizeVertical * 9;
    double topPadding = mSizeConfig.topPadding;
    double horizontalMargin = mSizeConfig.blockSizeHorizontal * 5;
    double verticalMargin = mSizeConfig.blockSizeVertical * 1.45;

    return Scaffold(
        appBar: MyCustomAppBar(
      height: appBarHeight,
      key: _scaffoldKey,
      topPadding: topPadding,
      horizontalMargin: horizontalMargin,
      verticalMargin: verticalMargin,
          mSizeConfig:mSizeConfig
    ));
  }
}
