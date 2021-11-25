import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/build_custom_button.dart';
import 'package:whole_snack/features/login_sign_up_main/controller/login_sign_up_main_page_controller.dart';

class BuildLoginSignUpMainPageBody extends StatelessWidget {
  BuildLoginSignUpMainPageBody({Key? key});

  final sizeConfig = Get.find<SizeConfig>();
  final controller = Get.find<LoginSignUpMainPageController>();

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return SingleChildScrollView(
      child: Container(
          height: sizeConfig.safeBlockVertical*100,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                height: sizeConfig.safeBlockVertical*80,
                  left: 0,
                  right: 0,
                  top:0,




                  child: Image.asset("assets/images/cover.png",fit: BoxFit.cover,)),

              Positioned(
                height: sizeConfig.safeBlockVertical*40,
                bottom: 0,
                left: 0,
                right: 0,



                child:  Container(
                  padding: EdgeInsets.all(kDefaultMargin),
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text("Welcome From Daily Neccessary!",style: TextStyle(

                        color: Colors.black,fontSize: kExtraLargeFontSize16.sp,
                        fontWeight: FontWeight.bold
                      ),),

                      Text("Get your groceries with same day delivery",style: TextStyle(

                          color:  Theme.of(context).colorScheme.onPrimary,fontSize: kSmallFontSize10.sp
                      ),),
                      SizedBox(
                        height: 24,
                      ),
                      BuildCustomButton(haveCorner: false, action: ()=>Get.toNamed("/login-phone-number-page"), title: "Login Account"),
                      SizedBox(
                        height: 16,
                      ),
                      BuildCustomButton(haveCorner: true, action: ()=>Get.toNamed("/sign-up-page"), title: "Don’t have account? Sign up"),



                    ],
                  )



                ),






              ),
              Positioned(
                 bottom: sizeConfig.safeBlockVertical*33,
                  left: 0,
                  right: 0,


                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                child: Image.asset("assets/images/logo.png",height: sizeConfig.safeBlockVertical*15,),
              ))
            ],
          )),
    );
  }
}
