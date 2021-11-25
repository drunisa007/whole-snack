import 'package:get/get.dart';
import 'package:whole_snack/features/about_page/binding/about_page_binding.dart';
import 'package:whole_snack/features/about_page/view/about_page.dart';
import 'package:whole_snack/features/add_address/bindings/add_address_bindings.dart';
import 'package:whole_snack/features/add_address/view/add_address_page.dart';
import 'package:whole_snack/features/checkout/binding/checkout_binding.dart';
import 'package:whole_snack/features/checkout/view/checkout_page.dart';
import 'package:whole_snack/features/customer_support/binding/customer_support_page_binding.dart';
import 'package:whole_snack/features/customer_support/view/customer_support_page.dart';
import 'package:whole_snack/features/edit_profile/binding/edit_profile_binding.dart';
import 'package:whole_snack/features/edit_profile/view/edit_profile_page.dart';
import 'package:whole_snack/features/feature_main/binding/feature_main_binding.dart';
import 'package:whole_snack/features/feature_main/view/feature_main.dart';
import 'package:whole_snack/features/login_phone_number/bindings/login_phone_number_page_binding.dart';
import 'package:whole_snack/features/login_phone_number/view/login_phone_number_page.dart';
import 'package:whole_snack/features/login_sign_up_main/bindings/login_sign_up_main_page_binding.dart';
import 'package:whole_snack/features/login_sign_up_main/view/login_sign_up_main_page.dart';
import 'package:whole_snack/features/manage_address/binding/manage_address_binding.dart';
import 'package:whole_snack/features/manage_address/view/manage_address_page.dart';
import 'package:whole_snack/features/order_detail/binding/order_detail_page_binding.dart';
import 'package:whole_snack/features/order_detail/view/order_detail_page.dart';
import 'package:whole_snack/features/order_success/binding/order_success_binding.dart';
import 'package:whole_snack/features/order_success/view/order_success_page.dart';
import 'package:whole_snack/features/item/binding/item_binding.dart';
import 'package:whole_snack/features/item/view/item_page.dart';
import 'package:whole_snack/features/otp_page/binding/otp_page_binding.dart';
import 'package:whole_snack/features/otp_page/view/otp_page.dart';
import 'package:whole_snack/features/sign_up_page/binding/sign_up_page_binding.dart';
import 'package:whole_snack/features/sign_up_page/view/sign_up_page.dart';
import 'package:whole_snack/features/search/binding/search_binding.dart';
import 'package:whole_snack/features/search/view/search_page.dart';



class RoutePage {
  var routePage = [
    GetPage(
        name: '/',
        page: () => const FeatureMain(),
        binding: FeatureMainBinding()),
    GetPage(
        name: '/order-success-page',
        page: () => OrderSuccessPage(),
        binding: OrderSuccessBinding()),
    GetPage(
        name: '/order-detail-page',
        page: () => OrderDetailPage(),
        binding: OrderDetailPageBinding()),
    GetPage(
        name: '/add-address-page',
        page: () => AddAddressPage(),
        binding: AddAddresPageBindings()),
    GetPage(
        name: '/customer-support-page',
        page: () => CustomerSupportPage(),
        binding: CustomerSupportPageBinding()),
    GetPage(
        name: '/about-page' , page:()=> AboutPage(),
      binding: AboutPageBinding()
    ),
    GetPage(
        name: '/manage-address-page' , page:()=> ManageAddressPage(),
        binding: ManageAddrssBinding()
    ),
    GetPage(
      name: '/edit-profile-page',
      page: ()=>EditProfilePage(),
      binding: EditProfilePageBinding()
    ),
    GetPage(
      name: '/item-page',
      page: () =>  ItemPage(),
      binding: ItemBinding()
    ),
    GetPage(
        name: '/login-sign-up-main-page',
        page: () =>  LoginSignUpMainPage(),
        binding: LoginSignUpMainPageBinding()
    ),
    GetPage(name: "/login-phone-number-page", page: ()=>LoginPhoneNumberPage(),
      binding: LoginPhoneNumberPageBinding()
    ),
    GetPage(name: "/sign-up-page", page: () =>SignUpPage(),

    binding: SignUpPageBinding()
    ),
    GetPage(name: "/otp-page", page: () =>OtpPage(),

        binding: OtpPageBinding()
    ),
     GetPage(
        name: '/search-page',
        page: () => SearchPage(),
        binding: SearchBinding()
    ),
    GetPage(
        name: '/checkout-page',
        page: () => CheckOutPage(),
        binding: CheckOutBinding()
    )





  ];
}
