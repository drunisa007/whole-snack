import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyDataDesign extends StatelessWidget {

  final String image;
  final String title;
  final String content;
  final String buttonText;
  final buttonAction;

  const EmptyDataDesign({Key? key,
    required this.image,
    required this.title,
    required this.content,
    required this.buttonText,
    this.buttonAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);

    return Container(
      width: double.infinity,
      height: mSizeConfig.blockSizeVertical*50,
      color: Colors.white,
      child: Center(
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: mSizeConfig.blockSizeVertical*20,
                height: mSizeConfig.blockSizeVertical*20,
                child: Lottie.asset(image),
              ),
              Text(title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w800)),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 65.sp, vertical: 12.sp),
                child: Text(content,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    )),
              ),
              ElevatedButton(
                onPressed: buttonAction,
                child: Text(buttonText),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50.sp),
                    primary: Theme.of(context).primaryColor,
                    onPrimary: Colors.white,
                    textStyle:
                    TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500,color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
