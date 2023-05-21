import 'package:comp491_mobile_frontend/constants/app_colors.dart';
import 'package:comp491_mobile_frontend/constants/routes.dart';
import 'package:comp491_mobile_frontend/constants/text_styles.dart';
import 'package:comp491_mobile_frontend/controllers/popup_controller.dart';
import 'package:comp491_mobile_frontend/controllers/register_controller.dart';
import 'package:comp491_mobile_frontend/screens/metamask_screen.dart';
import 'package:comp491_mobile_frontend/widgets/settings_item.dart';
import 'package:comp491_mobile_frontend/widgets/top_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutDevelopersScreen extends StatelessWidget {
  const AboutDevelopersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        width: 375.w,
        height: 812.h,
        child: Column(
          children: [
            SizedBox(
              height: 48.h,
            ),
            TopMenu(text: "About Devs"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    "Developer of This Application:",
                    style: TextStyles.mainTextStyle
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SettingsItem(
                      text: "Metin Arda Oral",
                      onTap: () {
                        launchUrl(Uri(
                          scheme: 'https',
                          host: 'linkedin.com',
                          path: '/in/metinardaoral',
                        ));
                      }),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "Other Developers:",
                    style: TextStyles.mainTextStyle
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SettingsItem(text: "Tolgay Dulger", onTap: () {}),
                  SizedBox(
                    height: 16.h,
                  ),
                  SettingsItem(text: "Ziya Icoz", onTap: () {}),
                  SizedBox(
                    height: 16.h,
                  ),
                  SettingsItem(text: "M. Enes Erciyes", onTap: () {}),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "Made for COMP491 finishing project @Koc University.",
                    style: TextStyles.mainTextStyle,
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
