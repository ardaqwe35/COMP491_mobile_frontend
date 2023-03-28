import 'package:comp491_mobile_frontend/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle mainTextStyle = GoogleFonts.josefinSans(
      textStyle: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.mainColor));

  static TextStyle secondTextStyle = GoogleFonts.dmSans(
      textStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.secondColor));

  // static TextStyle mainText = TextStyle(
  //     fontSize: 22.sp, fontWeight: FontWeight.w400, color: AppColors.mainColor);
}
