import 'package:auto_size_text/auto_size_text.dart';
import 'package:comp491_mobile_frontend/constants/app_colors.dart';
import 'package:comp491_mobile_frontend/constants/text_styles.dart';
import 'package:comp491_mobile_frontend/widgets/attachment_bar.dart';
import 'package:comp491_mobile_frontend/widgets/back_button.dart';
import 'package:comp491_mobile_frontend/widgets/main_button.dart';
import 'package:comp491_mobile_frontend/widgets/top_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 60.h,
            ),
            Container(
              width: 375.w,
              height: 65.h,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  BackButtonWidget(
                    asset: 'assets/icons/leftArrowDark.png',
                  ),
                  Spacer(),
                  MainButton(
                    label: "Post",
                    onTap: () {},
                    isDisable: false,
                    width: 80.w,
                    height: 30.h,
                    verticalPadding: EdgeInsets.zero,
                    labelStyle: TextStyles.mainTextStyle
                        .copyWith(fontSize: 16.sp, color: AppColors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: TextField(
                maxLength: 40,
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: 'Title',
                  border: InputBorder.none,
                  hintStyle: TextStyles.mainTextStyle
                      .copyWith(color: AppColors.mainColor.withOpacity(0.6)),
                  counterText: '',
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SizedBox(
                height: 120.h,
                child: TextField(
                  maxLength: 280,
                  maxLines: 8,
                  decoration: InputDecoration(
                    hintText: 'Body text',
                    border: InputBorder.none,
                    hintStyle: TextStyles.mainTextStyle
                        .copyWith(color: AppColors.mainColor.withOpacity(0.6)),
                    counterText: '',
                  ),
                ),
              ),
            ),
            Spacer(),
            AttachmentBar(),
            SizedBox(
              height: 48.h,
            )
          ],
        ),
      ),
    );
  }
}
