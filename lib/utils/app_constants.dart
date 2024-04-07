import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_agency_task/utils/app_colors.dart';

class AppConstants {
  static List<BoxShadow> boxShadow = [
    BoxShadow(
      color: AppColors.grey.withOpacity(0.10),
      blurRadius: 10,
      offset: const Offset(0, 0),
    ),
  ];
  static bool isDarkMode(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static TextStyle get textRegular => TextStyle(
        fontSize: 14.sp,
      );
  static TextStyle get titilliumRegular =>
      textRegular.copyWith(fontSize: 12.sp);

  static TextStyle get titleRegular => textRegular.copyWith(
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleHeader => textRegular.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
      );
  static TextStyle get titilliumSemiBold => textRegular.copyWith(
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titilliumBold => textRegular.copyWith(
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titilliumItalic => textRegular.copyWith(
        fontStyle: FontStyle.italic,
      );

  static TextStyle get textMedium => textRegular.copyWith(
        fontWeight: FontWeight.w500,
      );
  static TextStyle get textBold => textRegular.copyWith(
        fontWeight: FontWeight.w600,
      );

  static TextStyle get robotoBold => textRegular.copyWith(
        fontWeight: FontWeight.w700,
      );
}
