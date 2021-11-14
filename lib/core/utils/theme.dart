import 'package:flutter/material.dart';
import 'package:whole_snack/core/constants/default_values.dart';

class StyleTheme{


  ThemeData getTheme(){
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor:  scaffoldBackgroundColor,
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: secondaryColor,
      ),
    );
  }
}