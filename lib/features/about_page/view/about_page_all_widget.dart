import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/about_page/controller/about_page_controller.dart';

Widget aboutPageAllWidget(BuildContext context,SizeConfig sizeConfig,AboutPageController controller) {


  return Container(
    padding: EdgeInsets.all(8),
    margin: EdgeInsets.only(top: 16),
    color: Colors.white,
    child: _buildTextStyle(context, "**Just For Your Daily** \n "
        "You can find Daily Necessities & Grocery Products with FREE DELIVERY on www.dailymdy.com \n \n"
        "Just shop with us to save your precious time and budget.\n \n"
        "Address \n"
        "65B, Bet 110St & 111St, Chan Mya TharSi, Mandalay. Mandalay, Myanmar, 05041 \n \n"
        "Phone \n"
        "09 75 1111 906 \n"
        "09 9750 1111 6"),
  );
}

Widget _buildTextStyle(BuildContext context, String text) {

  return Text(text,style: TextStyle(color: Colors.black.withOpacity(0.7),
  fontSize: kLargeFontSize14.sp),
  );

}