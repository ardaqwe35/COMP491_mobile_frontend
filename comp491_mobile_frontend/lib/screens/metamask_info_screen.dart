import 'package:comp491_mobile_frontend/constants/app_colors.dart';
import 'package:comp491_mobile_frontend/constants/text_styles.dart';
import 'package:comp491_mobile_frontend/controllers/metamask_controller.dart';
import 'package:comp491_mobile_frontend/screens/create_account_screen.dart';
import 'package:comp491_mobile_frontend/widgets/main_button.dart';
import 'package:comp491_mobile_frontend/widgets/top_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MetamaskInfoScreen extends StatelessWidget {
  const MetamaskInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            TopMenu(
              text: "How to Connect Wallet?",
            ),
            SizedBox(
              height: 36.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1. Ensure the Metamask app is downloaded to your phone.",
                    style: TextStyles.mainTextStyle,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    "2. Press the 'Connect to Metamask' button on the previous page.",
                    style: TextStyles.mainTextStyle,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    "3. Allow from the Metamask app to share your public key with us.",
                    style: TextStyles.mainTextStyle,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    "4. Success! You can see your wallet details & continue.",
                    style: TextStyles.mainTextStyle,
                  ),
                  SizedBox(
                    height: 340.h,
                  ),
                  MainButton(
                    label: "Understood",
                    onTap: () {
                      Get.back();
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
