import 'package:comp491_mobile_frontend/widgets/tabbar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class TabbarWidget extends StatelessWidget {
  const TabbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TabbarController tabbarController = Get.put(TabbarController());
    return Row(
      children: [
        for (int i = 0; i < 3; i++)
          TabbarItemWidget(
              asset: tabbarController.getTabbarItemAsset(i),
              text: tabbarController.getTabbarItemString(i))
      ],
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
}
