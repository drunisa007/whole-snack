
import 'package:flutter/material.dart';

import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whole_snack/core/widgets/build_custom_button.dart';


class NoDataPage extends StatelessWidget {


 ///NoDataPage({Key? key}) : super(key: key);
  ///
  String imagePath;
  String title;
  String subtitle;
  String buttonTitle;
  bool isButton;
  SizeConfig sizeConfig;
  final  action;
  NoDataPage({required this.imagePath,required this.title,required this.subtitle,required this.buttonTitle,required this.isButton,
    required this.action,required this.sizeConfig});








  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("$imagePath",height: sizeConfig.blockSizeVertical*50,),

              Text("$title",style: TextStyle(fontSize: kExtraLargeFontSize16.sp,fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),),
              SizedBox(height: 8,),

              Text("$subtitle",style: TextStyle(fontSize: kSmallFontSize10,
                  color: Theme.of(context).colorScheme.onPrimary),),
              SizedBox(height: 16,),

              isButton? SizedBox(

                width: sizeConfig.blockSizeHorizontal*20,
                  child: BuildCustomButton(haveCorner: false, action: ()=>print('testing'), title: buttonTitle)):SizedBox(height: 1,),



            ],
          ),
        ),
      ),
    );
  }


}
