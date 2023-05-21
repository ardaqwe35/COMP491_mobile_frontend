import 'package:comp491_mobile_frontend/constants/app_colors.dart';
import 'package:comp491_mobile_frontend/constants/routes.dart';
import 'package:comp491_mobile_frontend/constants/text_styles.dart';
import 'package:comp491_mobile_frontend/screens/metamask_screen.dart';
import 'package:comp491_mobile_frontend/screens/sign_up_screen.dart';
import 'package:comp491_mobile_frontend/widgets/main_button.dart';
import 'package:comp491_mobile_frontend/widgets/post_widget.dart';
import 'package:comp491_mobile_frontend/widgets/search_widget.dart';
import 'package:comp491_mobile_frontend/widgets/tabbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Container(
            height: 812.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 72.h,
                ),
                Text(
                  "Welcome to ZATE Social!",
                  style: TextStyles.mainTextStyle,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Image.asset(
                  "assets/images/onboardingBackground.png",
                  width: 327.w,
                  height: 327.w,
                ),
                Text(
                  "ZATE Social is a social media application where you can interact and communicate with ZATE Network members!",
                  style: TextStyles.mainTextStyle.copyWith(
                      color: AppColors.darkBackgroundColor, fontSize: 19.sp),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "To get started, please connect your wallet & register to ZATE Social.",
                  style: TextStyles.mainTextStyle.copyWith(
                      color: AppColors.darkBackgroundColor, fontSize: 19.sp),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 45.h),
                  child: MainButton(
                      label: "Continue",
                      onTap: () {
                        Get.toNamed(Routes.connectWalletScreen,
                            arguments: {"source": Routes.onboardingScreen});
                      },
                      labelStyle: TextStyles.mainTextStyle
                          .copyWith(color: AppColors.white),
                      isDisable: false),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
