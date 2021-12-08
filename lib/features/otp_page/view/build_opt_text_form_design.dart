import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/otp_page/controller/otp_page_controller.dart';
import 'package:whole_snack/features/otp_page/view/otp_page.dart';

class BuildOtpTextFormDesign extends StatefulWidget {

  const BuildOtpTextFormDesign(
      {Key? key})
      : super(key: key);

  @override
  State<BuildOtpTextFormDesign> createState() => _BuildOtpTextFormDesignState();
}

class _BuildOtpTextFormDesignState extends State<BuildOtpTextFormDesign> {



  @override
  Widget build(BuildContext context) {
    SizeConfig mSizeConfig = Get.find<SizeConfig>();
    mSizeConfig.init(context);

    OtpPageController mOptPageController = Get.find<OtpPageController>();

    ///arun code
    FocusNode inputNode;

    inputNode = FocusNode();

    mOptPageController.mAllCodeController.addListener(() {
      mOptPageController.addSingleNewCode(context,inputNode);
    });

    return Container(
        height: mSizeConfig.blockSizeVertical * 5,
        width: double.infinity,
        child: Align(
          alignment: Alignment.center,
          child: Stack(
            children: [
              Obx(
                () => ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print("working");
                        setState(() {
                          inputNode.requestFocus();
                        });

                      },
                      child: Container(
                        height: mSizeConfig.blockSizeVertical * 5,
                        width: mSizeConfig.blockSizeVertical * 5,
                        margin: EdgeInsets.symmetric(horizontal: kDefaultMargin.sp),
                        decoration: BoxDecoration(
                            color:Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5.sp)),
                        child: Center(
                          child: Text(
                            "${mOptPageController.mOptCodeList[index]}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: mOptPageController.mOptCodeList.length,
                ),
              ),
              Container(
                width: 0,
                height: 0,
                child: TextField(
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  focusNode: inputNode,
                  controller: mOptPageController.mAllCodeController,
                ),
              )
            ],
          ),
        ));
  }
}
