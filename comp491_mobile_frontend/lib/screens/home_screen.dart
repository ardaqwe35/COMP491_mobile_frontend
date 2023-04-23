import 'package:comp491_mobile_frontend/constants/app_colors.dart';
import 'package:comp491_mobile_frontend/widgets/post_widget.dart';
import 'package:comp491_mobile_frontend/widgets/search_widget.dart';
import 'package:comp491_mobile_frontend/widgets/tabbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        width: 375.w,
        height: 812.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 72.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SearchWidget(),
            ),
            SizedBox(
              height: 24.h,
            ),
            PostWidget(
                type: PostType.assetAndText,
                asset: "assets/icons/camera.png",
                text: "SDFGHFJK",
                profileName: "asdsad",
                profileUrl: "asd"),
            Spacer(),
            TabbarWidget(),
          ],
        ),
      ),
    );
  }
}
