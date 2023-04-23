import 'package:auto_size_text/auto_size_text.dart';
import 'package:comp491_mobile_frontend/constants/app_colors.dart';
import 'package:comp491_mobile_frontend/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TabbarItemWidget extends StatelessWidget {
  final String asset;
  final String text;
  final VoidCallback onTap;

  const TabbarItemWidget(
      {super.key,
      required this.asset,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColors.white,
        width: 125.w,
        height: 96.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 12.h,
            ),
            Image.asset(
              asset,
              width: 30.w,
              height: 30.w,
            ),
            SizedBox(
              height: 11.h,
            ),
            Container(
              width: 100.w,
              height: 16.h,
              child: AutoSizeText(
                text,
                textAlign: TextAlign.center,
                style: TextStyles.mainTextStyle.copyWith(fontSize: 12.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
