import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/build_custom_button.dart';
import 'package:whole_snack/features/sign_up_page/controller/sign_up_page_controller.dart';

class BuildSignUpPageBody extends StatelessWidget {
  BuildSignUpPageBody({Key? key}) : super(key: key);

  final sizeConfig = Get.find<SizeConfig>();
  final controller = Get.find<SignUpPageController>();

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    sizeConfig.init(context);
    return SingleChildScrollView(
      child: Container(
          height: sizeConfig.blockSizeVertical * 100,
          width: double.infinity,
          color: Colors.white,
          child: Stack(
            children: [
              Positioned(
                  height: sizeConfig.safeBlockVertical * 80,
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Image.asset(
                    "assets/images/cover.png",
                    fit: BoxFit.cover,
                  )),
              Positioned(
                height: sizeConfig.safeBlockVertical * 58,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    padding: EdgeInsets.all(kDefaultMargin),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create Account",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: kExtraLargeFontSize16.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Enter your info and verifty number to signup.",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: kSmallFontSize10.sp),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Fullname",
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryVariant,
                              fontSize: kMediumFontSize12.sp),
                        ),
                        TextField(
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryVariant,
                              fontSize: kExtraLargeFontSize16.sp,
                              fontWeight: FontWeight.bold),
                          controller: nameController,
                          decoration: InputDecoration(
                              filled: true,
                              hintStyle: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: kMediumFontSize12.sp,
                              ),
                              hintText: "Full Name",
                              fillColor: Colors.grey.withOpacity(0.1),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Phone Number",
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryVariant,
                              fontSize: kMediumFontSize12.sp),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryVariant,
                              fontSize: kExtraLargeFontSize16.sp,
                              fontWeight: FontWeight.bold),
                          controller: phoneController,
                          decoration: InputDecoration(
                              filled: true,
                              hintStyle: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: kMediumFontSize12.sp,
                              ),
                              hintText: "09******",
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
                        BuildCustomButton(
                            haveCorner: false,
                            action: ()  async => {
                               await controller.getLoginData(nameController.text,phoneController.text,context),
                            /*  print(nameController.text),
                            if (controller.isLoading)
                                    {
                                      showLoaderDialog(context),

                                    } else {
                              Get.back(),
                    Get.toNamed("/otp-page"),

                            },
*/







                                },
                            title: "Verify Phone Number"),
                      ],
                    )),
              ),
              Positioned(
                  bottom: sizeConfig.safeBlockVertical * 51,
                  left: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: sizeConfig.safeBlockVertical * 15,
                    ),
                  ))
            ],
          )),
    );
  }

/*  showLoaderDialog(context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible:false,
      context: context,
      builder: (BuildContext context) {

         // Navigator.of(context).pop(true);

        return alert;
      },
    );
  }*/


}
