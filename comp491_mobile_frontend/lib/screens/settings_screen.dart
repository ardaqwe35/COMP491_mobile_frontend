import 'package:comp491_mobile_frontend/constants/app_colors.dart';
import 'package:comp491_mobile_frontend/constants/text_styles.dart';
import 'package:comp491_mobile_frontend/widgets/settings_item.dart';
import 'package:comp491_mobile_frontend/widgets/top_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        width: 375.w,
        height: 812.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 48.h,
              ),
              TopMenu(text: "Settings"),
              SizedBox(
                height: 24.h,
              ),
              Text(
                "General",
                style: TextStyles.mainTextStyle
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 16.h,
              ),
              SettingsItem(
                  text: "Manage Your Wallet",
                  onTap: () {
                    //navigate to wallet
                  }),
              SizedBox(
                height: 16.h,
              ),
              SettingsItem(
                  text: "Dark Mode (coming soon)",
                  onTap: () {
                    //navigate to wallet
                  }),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Support",
                style: TextStyles.mainTextStyle
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 16.h,
              ),
              SettingsItem(
                  text: "About Developers",
                  onTap: () {
                    //navigate to wallet
                  }),
              SizedBox(
                height: 16.h,
              ),
              SettingsItem(
                  text: "Contact Us",
                  onTap: () {
                    //navigate to wallet
                  }),
              SizedBox(
                height: 16.h,
              ),
              SettingsItem(
                  text: "Email Support",
                  onTap: () {
                    //navigate to wallet
                  }),
              SizedBox(
                height: 16.h,
              ),
              SettingsItem(
                  text: "Privacy & Terms",
                  onTap: () {
                    //navigate to wallet
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
