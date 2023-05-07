import 'package:auto_size_text/auto_size_text.dart';
import 'package:comp491_mobile_frontend/constants/app_colors.dart';
import 'package:comp491_mobile_frontend/constants/routes.dart';
import 'package:comp491_mobile_frontend/constants/text_styles.dart';
import 'package:comp491_mobile_frontend/widgets/main_button.dart';
import 'package:comp491_mobile_frontend/widgets/post_widget.dart';
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
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 375.w,
              width: 375.w,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    child: ProfileBanner(asset: 'assets/images/fluffy3x.png'),
                  ),
                  Positioned(
                    right: 24.w,
                    top: 60.w,
                    child: SettingsButton(),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfilePostsLikesBar(),
                PostWidget(
                    type: PostType.assetOnly,
                    assetUrl: "https://picsum.photos/800",
                    profileName: "Fluffy",
                    profileUrl: "")
              ],
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
            color: AppColors.darkBackgroundColor.withOpacity(0.28),
          ),
          Positioned(
              bottom: 40.h,
              left: 24.w,
              child: ProfileExplanation(
                followerCount: 54,
                gildCount: 132,
                username: 'Fluffy',
              )),
          Positioned(
            right: 24.w,
            bottom: 24.h,
            child: ProfilePhoto(),
          ),
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

class ProfileExplanation extends StatelessWidget {
  final String username;
  final int followerCount;
  final int gildCount;
  const ProfileExplanation(
      {super.key,
      required this.followerCount,
      required this.gildCount,
      required this.username});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.h,
          width: 208.w,
          child: AutoSizeText(username,
              style: TextStyles.mainTextStyle.copyWith(
                color: AppColors.white,
              )),
        ),
        SizedBox(height: 5.h),
        SizedBox(
          height: 20.h,
          width: 208.w,
          child: AutoSizeText(
            "$followerCount followers & $gildCount gilds",
            style: TextStyles.secondTextStyle,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        MainButton(
          label: "Edit Profile",
          labelStyle: TextStyles.mainTextStyle
              .copyWith(color: Colors.white, fontSize: 14.sp),
          verticalPadding: EdgeInsets.zero,
          onTap: () {},
          isDisable: false,
          width: 100.w,
          height: 30.h,
        ),
      ],
    );
  }
}

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.h,
      height: 100.h,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(50.h),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.h),
        child: Image.network("https://picsum.photos/300"),
      ),
    );
  }
}

class ProfilePostsLikesBar extends StatelessWidget {
  const ProfilePostsLikesBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 49.h,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 7.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              "Previous Posts",
              textAlign: TextAlign.center,
              style: TextStyles.mainTextStyle.copyWith(color: AppColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
