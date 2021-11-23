import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/utils/size_config.dart';
import 'package:whole_snack/features/customer_support/controller/customer_support_page_controller.dart';

Widget customerSupportPageAllWidget(BuildContext context, SizeConfig sizeConfig,
    CustomerSupportPageController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: kDefaultMargin),
        child: Text("For Customer Support",
            style: TextStyle(
                color: Colors.black,
                fontSize: kMediumFontSize12.sp,
                )),
      ),
      Container(

        decoration: BoxDecoration(

          color: Colors.white,
          border: Border.all(
            color: Colors.grey.withOpacity(0.5)
          )
        ),
        child: Column(
          children: [
            _buildCustomerSigleItem(context, sizeConfig, controller, "09420049484", ()=> print("hello world")),
            Divider(),
            _buildCustomerSigleItem(context, sizeConfig, controller, "09420049484", ()=> print("hello world")),
          ],
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(left: kDefaultMargin,top: 20,bottom: 16),
        child: Text("For Technical Support",
            style: TextStyle(
                color: Colors.black,
                fontSize: kMediumFontSize12.sp,
               )),
      ),
      Container(

        decoration: BoxDecoration(

            color: Colors.white,
            border: Border.all(
                color: Colors.grey.withOpacity(0.5)
            )
        ),
        child: Column(
          children: [
            _buildCustomerSigleItem(context, sizeConfig, controller, "09420049484", ()=> print("hello world")),
            Divider(),
            _buildCustomerSigleItem(context, sizeConfig, controller, "09420049484", ()=> print("hello world")),
          ],
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(left: kDefaultMargin,top: 20,bottom: 16),
        child: Text("For Email Support",
            style: TextStyle(
                color: Colors.black,
                fontSize: kMediumFontSize12.sp,
                )),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: kDefaultMargin,vertical: 16),

        decoration: BoxDecoration(

            color: Colors.white,
            border: Border.all(
                color: Colors.grey.withOpacity(0.5)
            )
        ),
        child: Row(
          children: [
            Icon(
              Icons.email,
              size: 24.sp,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            SizedBox(
              width: 16,
            ),
            Text("dailymdy@gmail.com",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: kMediumFontSize12.sp,
                    )),
            Spacer(),
            GestureDetector(
              onTap:()=> print("hello wolrd"),
              child: CircleAvatar(
                  maxRadius: sizeConfig.blockSizeVertical*2,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(Icons.send,size: 18.sp,color: Colors.white,)),
            )
          ],
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(left: 8,top: 20,bottom: 8),
        child: Text("Social Media Contact",
            style: TextStyle(
                color: Colors.black,
                fontSize: kLargeFontSize14.sp,
                )),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
           _buildSocialButton(context, controller, sizeConfig, "assets/images/viber.png", ()=>print("hahhaha")),
            SizedBox(width: 16,),
            _buildSocialButton(context, controller, sizeConfig, "assets/images/messenger.png", ()=>print("hahhaha")),
            SizedBox(width: 16,),
            _buildSocialButton(context, controller, sizeConfig, "assets/images/facebook.png", ()=>print("hahhaha")),
          ],
        ),
      ),



    ],
  );
}

Widget _buildSocialButton (BuildContext context, CustomerSupportPageController controller, SizeConfig sizeConfig,String imagePath,Function function) {


  return Container(
    height: sizeConfig.blockSizeHorizontal*9,
    width: sizeConfig.blockSizeHorizontal*9,
    decoration: BoxDecoration(
        shape: BoxShape.circle

    ),
    child: Image.asset(imagePath,fit: BoxFit.fill,),
  );
}
Widget _buildCustomerSigleItem(BuildContext context, SizeConfig sizeConfig,
    CustomerSupportPageController controller, String number1, Function onClick) {
  return Container(
    color: Colors.white,

    padding: EdgeInsets.all(8),
    child: Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.support_agent,
              size: 24.sp,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            SizedBox(
              width: 16,
            ),
            Text(number1,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: kMediumFontSize12.sp,
                   )),
            Spacer(),
            GestureDetector(
              onTap:()=> onClick,
              child: CircleAvatar(
                maxRadius: sizeConfig.blockSizeVertical*2,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(Icons.phone,size: 18.sp,color: Colors.white,)),
            )
          ],
        ),
      ],
    ),
  );
}
