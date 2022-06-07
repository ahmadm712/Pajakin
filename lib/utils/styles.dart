import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color kColorPrimary = const Color(0xff005478);
Color kColorSecondary = Colors.white;

Color primaryBlue = const Color(0xff2972ff);
Color colorLight = const Color(0xfffbfbfb);
Color textBlack = const Color(0xff222222);
Color textGrey = const Color(0xff94959b);
Color textWhiteGrey = const Color(0xfff1f1f5);

TextStyle heading2 = const TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
);

TextStyle heading5 = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

TextStyle heading6 = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

TextStyle regular16pt = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

ThemeData theme = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kColorPrimary),
  textTheme: textTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: kColorPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          4,
        ),
      ),
    ),
  ),
);

final textTheme = TextTheme(
  headline1: GoogleFonts.poppins(
      fontSize: 93, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.poppins(
      fontSize: 58, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.poppins(fontSize: 46, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.poppins(
      fontSize: 33, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.poppins(
      fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.poppins(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.poppins(
      fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.openSans(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.openSans(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.openSans(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.openSans(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.openSans(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
