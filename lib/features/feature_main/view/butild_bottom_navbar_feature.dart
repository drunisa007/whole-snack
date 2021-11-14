import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whole_snack/features/feature_main/controller/feature_main_controller.dart';
class BuildButtonNavBarFeature extends StatelessWidget {

  final FeatureMainController featureMainController;

  const BuildButtonNavBarFeature({Key? key,required this.featureMainController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        getNavigationBarItem(
            "assets/images/home.svg", 'Home', context, 0, featureMainController),
        getNavigationBarItem(
            "assets/images/cart.svg", 'Category', context, 1, featureMainController),
        getNavigationBarItem(
            "assets/images/cart.svg", 'Cart', context, 2, featureMainController),
        getNavigationBarItem(
            "assets/images/order.svg", 'Order', context, 3, featureMainController),
        getNavigationBarItem("assets/images/profile.svg", 'Account', context, 4,
            featureMainController),
      ],
      elevation: 0,
      selectedItemColor: Theme.of(context).primaryColor,
      currentIndex: featureMainController.getIndex(),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      onTap: (index) {
        featureMainController.changeIndex(index);
      },
    );
  }
}

BottomNavigationBarItem getNavigationBarItem(
    iconName, label, context, index, FeatureMainController mController) {
  return BottomNavigationBarItem(
    icon: SvgPicture.asset(
      iconName,
      width: 20,
      height: 20,
      color: index == mController.getIndex()
          ? Theme.of(context).primaryColor
          : Colors.grey,
    ),
    label: label,
  );
}
