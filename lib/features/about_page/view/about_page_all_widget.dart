import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/about_page/controller/about_page_controller.dart';

class AboutPageAllWidget extends StatelessWidget {

 final SizeConfig sizeConfig;
  final AboutPageController controller;
  AboutPageAllWidget({required this.controller, required this.sizeConfig});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: 16),
      color: Colors.white,
      child:Text("**Just For Your Daily** \n "
          "You can find Daily Necessities & Grocery Products with FREE DELIVERY on www.dailymdy.com \n \n"
          "Just shop with us to save your precious time and budget.\n \n"
          "Address \n"
          "65B, Bet 110St & 111St, Chan Mya TharSi, Mandalay. Mandalay, Myanmar, 05041 \n \n"
          "Phone \n"
          "09 75 1111 906 \n"
          "09 9750 1111 6",
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,
            fontSize: kLargeFontSize13.sp),

      ),
    );
  }
}



