import 'package:comp491_mobile_frontend/constants/app_colors.dart';
import 'package:comp491_mobile_frontend/constants/text_styles.dart';
import 'package:comp491_mobile_frontend/controllers/register_controller.dart';
import 'package:comp491_mobile_frontend/widgets/main_button.dart';
import 'package:comp491_mobile_frontend/widgets/top_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterController controller = Get.put(RegisterController());
    TextEditingController emailController = TextEditingController();
    TextEditingController pwController = TextEditingController();
    TextEditingController pwController2 = TextEditingController();

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
            TopMenu(text: "Sign Up"),
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
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.sp),
                      color: AppColors.orange.withOpacity(0.25),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: TextField(
                        controller: emailController,
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
                    height: 12.h,
                  ),
                  Text(
                    "Password",
                    style: TextStyles.mainTextStyle,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Container(
                    width: 327.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.sp),
                      color: AppColors.orange.withOpacity(0.25),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: TextField(
                        controller: pwController,
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
                    height: 12.h,
                  ),
                  Text(
                    "Confirm Password",
                    style: TextStyles.mainTextStyle,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Container(
                    width: 327.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.sp),
                      color: AppColors.orange.withOpacity(0.25),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: TextField(
                        controller: pwController2,
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
                    label: "Create Account",
                    onTap: () {
                      controller.manageSignUp(emailController.text,
                          pwController.text, pwController2.text);
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
