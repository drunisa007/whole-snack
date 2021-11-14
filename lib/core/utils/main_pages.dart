import 'package:flutter/material.dart';
import 'package:whole_snack/features/account/view/account_page.dart';
import 'package:whole_snack/features/cart/view/cart_page.dart';
import 'package:whole_snack/features/category/view/category_page.dart';
import 'package:whole_snack/features/home/view/home_page.dart';
import 'package:whole_snack/features/order/view/order_page.dart';

class MainPages{
  List<Widget> mPages =[HomePage(),CategoryPage(),CartPage(),OrderPage(),AccountPage()];

  Widget getPages(int index){
    return mPages[index];
  }
}