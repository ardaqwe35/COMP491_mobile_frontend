import 'package:comp491_mobile_frontend/controllers/root_screen_controller.dart';
import 'package:comp491_mobile_frontend/screens/create_screen.dart';
import 'package:comp491_mobile_frontend/widgets/tabbar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class TabbarWidget extends StatelessWidget {
  final RootScreenController controller;
  const TabbarWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    TabbarController tabbarController = Get.put(TabbarController());
    return GestureDetector(
      onTapDown: (tapDownDetails) =>
          controller.handleTapDown(tapDownDetails, context),
      child: Row(
        children: [
          for (int i = 0; i < 3; i++)
            TabbarItemWidget(
              asset: tabbarController.getTabbarItemAsset(i),
              text: tabbarController.getTabbarItemString(i),
              onTap: tabbarController.getTabbarItemOnTap(i),
            )
        ],
      ),
    );
  }
}

class TabbarController extends GetxController {
  String getTabbarItemAsset(int index) {
    switch (index) {
      case 0:
        return 'assets/icons/homeDark.png';
      case 1:
        return 'assets/icons/createDark.png';
      case 2:
        return 'assets/icons/userDark.png';
      default:
        return 'assets/icons/homeDark.png';
    }
  }

  String getTabbarItemString(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Create';
      case 2:
        return 'Profile';
      default:
        return 'Home';
    }
  }

  VoidCallback getTabbarItemOnTap(int index) {
    switch (index) {
      case 0:
        return () {};
      case 1:
        return () {
          Get.to(CreateScreen());
        };
      case 2:
        return () {};
      default:
        return () {};
    }
  }
}
