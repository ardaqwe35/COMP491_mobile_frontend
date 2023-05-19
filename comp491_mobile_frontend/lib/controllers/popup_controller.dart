import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:comp491_mobile_frontend/constants/app_colors.dart';
import 'package:comp491_mobile_frontend/constants/text_styles.dart';
import 'package:comp491_mobile_frontend/widgets/main_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PopupController extends GetxController {
  static void showSnackbar(String text, {Color? color}) {
    //manage nudge and notification
    //succesfull case
    if (true) {
      Get.rawSnackbar(
        messageText: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyles.mainTextStyle.copyWith(color: Colors.white),
          ),
        ),
        backgroundColor: color ?? const Color(0xFFF2A4A4),
        duration: const Duration(milliseconds: 1600),
        snackPosition: SnackPosition.TOP,
        animationDuration: const Duration(milliseconds: 300),
        padding: EdgeInsets.all(15.sp),
        borderColor: color ?? const Color(0xFFF2A4A4),
        borderRadius: 2.sp,
      );
    }
  }

  Widget buildPopup(
      BuildContext context,
      String asset,
      String text,
      String text2,
      String buttonLabel,
      String buttonLabel2,
      VoidCallback onTapPositive,
      VoidCallback onTapNegative) {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(15.sp),
        color: Colors.white,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.sp),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.sp),
            ),
            width: 327.w,
            height: 461.h,
            child: Column(
              children: [
                Image.asset('assets/images/fluffy.png',
                    fit: BoxFit.contain, width: 375.w, height: 198.h),
                Padding(
                  padding: EdgeInsets.fromLTRB(24.w, 14.h, 24.w, 0),
                  child: Center(
                    child: SizedBox(
                      width: 189.w,
                      height: 50.h,
                      child: AutoSizeText(
                        text,
                        style: GoogleFonts.josefinSans(
                            textStyle: TextStyles.mainTextStyle),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 0),
                  child: Center(
                    child: AutoSizeText(
                      text2,
                      style: GoogleFonts.josefinSans(
                          textStyle: TextStyles.secondTextStyle),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
                  child: MainButton(
                    label: buttonLabel,
                    onTap: onTapPositive,
                    isDisable: false,
                    labelStyle:
                        TextStyles.mainTextStyle.copyWith(color: Colors.white),
                    color: AppColors.mainColor,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
                  child: MainButton(
                    label: buttonLabel2,
                    onTap: onTapNegative,
                    isDisable: false,
                    labelStyle: TextStyles.mainTextStyle
                        .copyWith(color: AppColors.mainColor),
                    color: Colors.transparent,
                    borderWidth: 1.sp,
                    borderColor: AppColors.mainColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
