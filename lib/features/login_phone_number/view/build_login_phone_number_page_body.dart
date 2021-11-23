import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/build_custom_button.dart';

class BuildLoginPhoneNumberPageBody extends StatelessWidget {
  BuildLoginPhoneNumberPageBody({Key? key}) ;

  final sizeConfig = Get.find<SizeConfig>();
  TextEditingController phoneController = TextEditingController();
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text("Login Account",style: TextStyle(

                            color: Colors.black,fontSize: kExtraLargeFontSize16.sp,
                            fontWeight: FontWeight.bold
                        ),),

                        Text("Enter your logged in account number.",style: TextStyle(

                            color:  Theme.of(context).colorScheme.onPrimary,fontSize: kMediumFontSize12.sp
                        ),),
                        SizedBox(
                          height: 16,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: kExtraLargeFontSize16.sp,
                              fontWeight: FontWeight.bold),
                          controller: phoneController,
                          decoration: InputDecoration(
                              filled: true,
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: kExtraLargeFontSize16.sp,
                                  fontWeight: FontWeight.bold),
                              hintText: "09",
                              fillColor: Colors.grey.withOpacity(0.1),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        BuildCustomButton(haveCorner: false, action: ()=>Get.toNamed('/otp-page'), title: "Verify Phone Number"),
                        SizedBox(
                          height: 16,
                        ),



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
