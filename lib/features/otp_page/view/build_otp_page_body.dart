import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/core/widgets/build_custom_button.dart';
import 'package:whole_snack/features/cart/controller/cart_controller.dart';
import 'package:whole_snack/features/otp_page/controller/otp_page_controller.dart';
import 'package:whole_snack/features/otp_page/view/build_opt_text_form_design.dart';

class BuildOtpPageBody extends StatelessWidget {
   BuildOtpPageBody({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    TextEditingController box1 = TextEditingController();
    TextEditingController box2 = TextEditingController();
    TextEditingController box3 = TextEditingController();
    TextEditingController box4 = TextEditingController();

    final sizeConfig = Get.find<SizeConfig>();
    sizeConfig.init(context);
    OtpPageController controller = Get.find<OtpPageController>();


    var data = Get.arguments;



    return SingleChildScrollView(


      child: Container(
          height: sizeConfig.blockSizeVertical*100,
          width: double.infinity,
          color: Colors.white,
          child: Stack(
            children: [
              Positioned(
                  height: sizeConfig.safeBlockVertical*80,
                  left: 0,
                  right: 0,
                  top:0,
                  child: Image.asset("assets/images/cover.png",fit: BoxFit.cover,)),

              Positioned(
                height: sizeConfig.safeBlockVertical*58,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        Text("Otp Page",style: TextStyle(

                            color: Colors.black,fontSize: kExtraLargeFontSize16.sp,
                            fontWeight: FontWeight.bold
                        ),),

                        SizedBox(
                          height: 16,
                        ),

                     BuildOtpTextFormDesign(),
                      /*  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _box(context,sizeConfig.safeBlockVertical*6,box1),
                            _box(context,sizeConfig.safeBlockVertical*6,box2),
                            _box(context,sizeConfig.safeBlockVertical*6,box3),
                            _box(context,sizeConfig.safeBlockVertical*6,box4),
                       *//*     _box(context,sizeConfig.safeBlockVertical*6),
                            _box(context,sizeConfig.safeBlockVertical*6),*//*


                          ],
                        ),*/
                        SizedBox(
                          height: 8,
                        ),
                        RichText(text: TextSpan(
                          children: [

                            TextSpan(text: "Enter 6-digits SMS code to continue.",style: TextStyle(

                                color:  Theme.of(context).colorScheme.onPrimary,fontSize: kMediumFontSize12.sp
                            ),),
                            TextSpan(text: "30s",style: TextStyle(

                                color:  Colors.transparent,fontSize: kMediumFontSize12.sp
                            ),),

                          ]
                        )),
                        SizedBox(
                          height: 24,
                        ),
                        BuildCustomButton(haveCorner: false, action: (){


                          if(controller.mOptCodeList.length==4){

                            controller.getOpt(name: data[0], phone: data[1], otp: controller.createOptCode(),context: context);
                          }
                          else{
                            if(!Get.isSnackbarOpen){
                              Get.snackbar("Opt Code", "Please fill otp code correctly.",duration: Duration(milliseconds: 500));
                            }

                          }

                         // otp =  box1.text+box2.text+box3.text+box4.text,
                         //
                         //  print(otp),
                         //  print("${data[0]} hahahah"),
                         //
                         //  await controller.getOpt(name: data[0], phone: data[1], otp: otp,context: context),


                        }, title: "Confirm Otp"),



                      ],
                    )



                ),






              ),
              Positioned(
                  bottom: sizeConfig.safeBlockVertical*51,
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
   Widget _box(context,size,TextEditingController textEditingController) {
     return Container(
       alignment: Alignment.center,

       margin: EdgeInsets.all(5),
       height:size,
       width: size,
       child: Center(
         child: TextField(

           controller: textEditingController,
           style: TextStyle(

                fontSize: kExtraLargeFontSize15.sp, color: Colors.black,fontWeight: FontWeight.bold),
           keyboardType: TextInputType.number,
           maxLength: 1,
           decoration: InputDecoration(border: InputBorder.none, counterText: ''),
           textAlign: TextAlign.center,
         ),
       ),
       decoration:
       BoxDecoration(
     color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.1)

     ),
     );
   }
}
