import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/constants/default_values.dart';



Widget buildNotFoundBody(BuildContext context,SizeConfig sizeConfig,
    {required String title,
    required String subtitle,
    required String buttonTittle,
   required String imagePath,
    required Function onClick}) {

  return Center(
    child: Column(
     crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        Image.asset(imagePath,height: sizeConfig.blockSizeVertical*40,width: sizeConfig.blockSizeHorizontal*40,),

        SizedBox(height: 16,),
        Text(title,style: TextStyle(color: Colors.black,fontSize: kLargeFontSize14.sp,fontWeight: FontWeight.w600),),
        SizedBox(height: 8,),
        Text(subtitle,style: TextStyle(color: Colors.grey,fontSize: kMediumFontSize12.sp,fontWeight: FontWeight.w400),),
        SizedBox(height: 16,),
        ButtonTheme(

          height: sizeConfig.blockSizeVertical*6.5,
          minWidth:  sizeConfig.blockSizeHorizontal*40,

          child: RaisedButton(

            color: Colors.red,
              child: Text(buttonTittle,style: TextStyle(color: Colors.white,fontSize: kExtraLargeFontSize16.sp,fontWeight: FontWeight.w600),),
              onPressed: () => print("it's pressed"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.sp),
              ),
            ),
        ),




      ],
    ),
  );
}