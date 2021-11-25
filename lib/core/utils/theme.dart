import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whole_snack/core/constants/default_values.dart';

class StyleTheme {
  ThemeData getTheme() {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: secondary,
        secondaryVariant: secondaryVariant,
        onSecondary: onSecondary,
        primaryVariant: primaryVariant, ///card bg color
        onPrimary: onPrimary,
        ///text  color
      ),
      textTheme: GoogleFonts.openSansTextTheme()
    );
  }
}
