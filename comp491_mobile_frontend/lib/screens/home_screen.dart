import 'package:comp491_mobile_frontend/constants/app_colors.dart';
import 'package:comp491_mobile_frontend/screens/onboarding_screen.dart';
import 'package:comp491_mobile_frontend/screens/sign_up_screen.dart';
import 'package:comp491_mobile_frontend/widgets/post_widget.dart';
import 'package:comp491_mobile_frontend/widgets/search_widget.dart';
import 'package:comp491_mobile_frontend/widgets/tabbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 72.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: GestureDetector(
                child: SearchWidget(),
                onTap: () {
                  Get.to(OnboardingScreen());
                },
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            PostWidget(
                type: PostType.assetAndText,
                asset: "assets/images/fluffy3x.png",
                text: "Look how amazing I am! It is a great day to be a bnuuy!",
                profileName: "asdsad",
                profileUrl: "asd"),
            PostWidget(
                type: PostType.assetOnly,
                asset: "assets/images/fluffy3x.png",
                profileName: "asdsad",
                profileUrl: "asd"),
          ],
        ),
      ),
    );
  }
}
