import 'package:get/get.dart';
import 'package:whole_snack/features/about_page/binding/about_page_binding.dart';
import 'package:whole_snack/features/about_page/view/about_page.dart';
import 'package:whole_snack/features/add_address/bindings/add_address_bindings.dart';
import 'package:whole_snack/features/add_address/view/add_address_page.dart';
import 'package:whole_snack/features/customer_support/binding/customer_support_page_binding.dart';
import 'package:whole_snack/features/customer_support/view/customer_support_page.dart';
import 'package:whole_snack/features/edit_profile/binding/edit_profile_binding.dart';
import 'package:whole_snack/features/edit_profile/view/edit_profile_page.dart';
import 'package:whole_snack/features/feature_main/binding/feature_main_binding.dart';
import 'package:whole_snack/features/feature_main/view/feature_main.dart';
import 'package:whole_snack/features/manage_address/binding/manage_address_binding.dart';
import 'package:whole_snack/features/manage_address/view/manage_address_page.dart';
import 'package:whole_snack/features/order_detail/binding/order_detail_page_binding.dart';
import 'package:whole_snack/features/order_detail/view/order_detail_page.dart';
import 'package:whole_snack/features/order_success/binding/order_success_binding.dart';
import 'package:whole_snack/features/order_success/view/order_success_page.dart';
import 'package:whole_snack/features/item/binding/item_binding.dart';
import 'package:whole_snack/features/item/view/item_page.dart';


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
    )

        name: '/item-page',
        page: () => const ItemPage(),

  ];
}
