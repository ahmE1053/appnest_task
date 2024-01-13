import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static const font = GoogleFonts.almarai;

  static TextStyle getW100({required double fontSize, Color? color}) => font(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w100,
        decorationColor: color,
      );

  static TextStyle getW200({required double fontSize, Color? color}) => font(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w200,
        decorationColor: color,
      );

  static TextStyle getW300({required double fontSize, Color? color}) => font(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w300,
        decorationColor: color,
      );

  static TextStyle getW400({required double fontSize, Color? color}) => font(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        decorationColor: color,
      );

  static TextStyle getW500({required double fontSize, Color? color}) => font(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        decorationColor: color,
      );

  static TextStyle getW600({required double fontSize, Color? color}) => font(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        decorationColor: color,
      );

  static TextStyle getW700({required double fontSize, Color? color}) => font(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        decorationColor: color,
      );

  static TextStyle getW800({required double fontSize, Color? color}) => font(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        decorationColor: color,
      );

  static TextStyle getW900({required double fontSize, Color? color}) => font(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
        decorationColor: color,
      );
}
