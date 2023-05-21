import 'package:comp491_mobile_frontend/constants/app_colors.dart';
import 'package:comp491_mobile_frontend/constants/routes.dart';
import 'package:comp491_mobile_frontend/constants/text_styles.dart';
import 'package:comp491_mobile_frontend/controllers/metamask_controller.dart';
import 'package:comp491_mobile_frontend/screens/create_account_screen.dart';
import 'package:comp491_mobile_frontend/screens/metamask_info_screen.dart';
import 'package:comp491_mobile_frontend/widgets/main_button.dart';
import 'package:comp491_mobile_frontend/widgets/top_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MetamaskScreen extends StatelessWidget {
  const MetamaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MetamaskController controller = Get.put(MetamaskController());
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
              text: Get.arguments["source"] != Routes.settingsScreen
                  ? "Connect Wallet"
                  : "Wallet Info",
              info: true,
              infoOnTap: () {
                Get.to(MetamaskInfoScreen());
              },
            ),
            SizedBox(
              height: 36.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Obx(() {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Status: ${walletStatusToString(controller.isWalletConnected.value)}",
                      style: TextStyles.mainTextStyle
                          .copyWith(color: AppColors.orange),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    getBalanceTexts(controller),
                  ],
                );
              }),
            ),
            Spacer(),
            Visibility(
              visible: Get.arguments["source"] != Routes.settingsScreen,
              child: Obx(() {
                if (controller.isWalletConnected.value ==
                    WalletStatus.hasCurrency) {
                  return Padding(
                    padding:
                        EdgeInsets.only(bottom: 45.h, left: 24.w, right: 24.w),
                    child: MainButton(
                      label: "Continue",
                      onTap: () {
                        controller.continueTapped();
                      },
                      isDisable: false,
                      labelStyle: TextStyles.mainTextStyle
                          .copyWith(color: Colors.white),
                    ),
                  );
                } else {
                  return Padding(
                    padding:
                        EdgeInsets.only(bottom: 45.h, left: 24.w, right: 24.w),
                    child: MainButton(
                      label: "Connect to Metamask",
                      onTap: () {
                        controller.connectMetamaskTapped();
                      },
                      isDisable: false,
                      labelStyle: TextStyles.mainTextStyle
                          .copyWith(color: Colors.white),
                    ),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBalanceTexts(MetamaskController controller) {
    List<Widget> children = [];
    if (controller.isWalletConnected.value == WalletStatus.connected) {
      children.add(
        Text(
          "Wallet connected, waiting for balance callback...",
          style: TextStyles.mainTextStyle.copyWith(color: AppColors.orange),
        ),
      );
    } else if (controller.isWalletConnected.value == WalletStatus.hasCurrency) {
      children.add(
        Text(
          "Balance: ${controller.walletBalance.value} ZATE",
          style: TextStyles.mainTextStyle.copyWith(color: AppColors.orange),
        ),
      );
    } else if (controller.isWalletConnected.value == WalletStatus.noCurrency) {
      children.add(
        Text(
          "Balance: ${controller.walletBalance.value} ZATE",
          style: TextStyles.mainTextStyle.copyWith(color: AppColors.orange),
        ),
      );
    } else if (controller.isWalletConnected.value ==
        WalletStatus.disconnected) {
    } else {
      children.add(
        Text(
          "ERROR",
          style: TextStyles.mainTextStyle.copyWith(color: AppColors.orange),
        ),
      );
    }
    return Column(
      children: children,
    );
  }
}
