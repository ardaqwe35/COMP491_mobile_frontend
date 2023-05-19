import 'package:auto_size_text/auto_size_text.dart';
import 'package:comp491_mobile_frontend/constants/app_colors.dart';
import 'package:comp491_mobile_frontend/constants/routes.dart';
import 'package:comp491_mobile_frontend/constants/text_styles.dart';
import 'package:comp491_mobile_frontend/controllers/register_controller.dart';
import 'package:comp491_mobile_frontend/screens/create_account_screen.dart';
import 'package:comp491_mobile_frontend/screens/root_screen.dart';
import 'package:comp491_mobile_frontend/widgets/main_button.dart';
import 'package:comp491_mobile_frontend/widgets/top_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterController controller = Get.put(RegisterController());
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        width: 375.w,
        height: 812.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 48.h,
            ),
            Padding(
              padding: EdgeInsets.all(24.w),
              child: Center(
                child: AutoSizeText(
                  "Sign Up/Login",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyles.mainTextStyle
                      .copyWith(fontSize: 32.sp, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: TextStyles.mainTextStyle,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    width: 327.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.sp),
                      color: AppColors.orange.withOpacity(0.25),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: TextField(
                        controller: controller.emailController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyles.secondTextStyle.copyWith(
                              color: AppColors.darkBackgroundColor,
                              fontSize: 16.sp,
                            )),
                        style: TextStyles.secondTextStyle.copyWith(
                            color: AppColors.darkBackgroundColor,
                            fontSize: 16.sp),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "Password",
                    style: TextStyles.mainTextStyle,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    width: 327.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.sp),
                      color: AppColors.orange.withOpacity(0.25),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: TextField(
                        controller: controller.passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyles.secondTextStyle.copyWith(
                              color: AppColors.darkBackgroundColor,
                              fontSize: 16.sp,
                            )),
                        style: TextStyles.secondTextStyle.copyWith(
                            color: AppColors.darkBackgroundColor,
                            fontSize: 16.sp),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  SizedBox(
                      height:
                          320.h - MediaQuery.of(context).viewInsets.bottom > 0
                              ? 320.h - MediaQuery.of(context).viewInsets.bottom
                              : 320.h),
                  MainButton(
                    label: "Login",
                    onTap: () {
                      //TODO MANAGE LOGIN
                      controller.manageLogin(
                          controller.emailController.value.text,
                          controller.passwordController.value.text);
                      //if success
                    },
                    isDisable: false,
                    labelStyle:
                        TextStyles.mainTextStyle.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  MainButton(
                    label: "Create Account",
                    onTap: () {
                      Get.to(CreateAccountScreen());
                    },
                    isDisable: false,
                    labelStyle:
                        TextStyles.mainTextStyle.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
