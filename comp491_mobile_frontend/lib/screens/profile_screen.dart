import 'package:comp491_mobile_frontend/constants/app_colors.dart';
import 'package:comp491_mobile_frontend/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 812.h,
        width: 375.w,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: ProfileBanner(asset: 'assets/images/fluffy3x.png'),
            ),
            Positioned(right: 24.w, top: 60.w, child: SettingsButton()),
            Column(
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileBanner extends StatelessWidget {
  final String asset;
  const ProfileBanner({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.sp),
      child: Stack(
        children: [
          Container(
            width: 375.w,
            height: 375.h,
            child: Image.asset(asset),
          ),
          Container(
            width: 375.w,
            height: 375.w,
            color: AppColors.darkBackgroundColor.withOpacity(0.2),
          )
        ],
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.settingsScreen);
      },
      child: SizedBox(
        width: 30.w,
        height: 30.w,
        child: Image.asset('assets/icons/settings.png'),
      ),
    );
  }
}
