import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantpal/app/core/constants.dart';

ThemeData theme() {
  return ThemeData(
      primaryColor: splashColor,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: GoogleFonts.ebGaramond()),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: darkGreeTextColor),
      scaffoldBackgroundColor: backgroundColor);
}
