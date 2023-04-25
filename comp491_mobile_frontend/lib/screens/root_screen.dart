import 'package:comp491_mobile_frontend/controllers/root_screen_controller.dart';
import 'package:comp491_mobile_frontend/screens/create_screen.dart';
import 'package:comp491_mobile_frontend/screens/home_screen.dart';
import 'package:comp491_mobile_frontend/screens/profile_screen.dart';
import 'package:comp491_mobile_frontend/widgets/tabbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RootScreenController controller =
        Get.put(RootScreenController(), permanent: true);

    return Obx(() => Scaffold(
          // extendBody: controller.pageIndex.value == 2 ? false : true,
          bottomNavigationBar:
              // controller.pageIndex.value == 2 ? SizedBox() : bunu yapamıyorum bozuluyor
              TabbarWidget(
            controller: controller,
          ),
          body: IndexedStack(
            index: controller.pageIndex.value,
            children: [
              HomeScreen(),
              ProfileScreen(),
              //ChatScreen(),
            ],
          ),
        ));
  }
}
