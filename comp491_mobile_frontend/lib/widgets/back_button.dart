import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BackButtonWidget extends StatelessWidget {
  final String? asset;
  const BackButtonWidget({super.key, this.asset});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        width: 30.w,
        height: 30.w,
        child: Image.asset(asset ?? 'assets/icons/leftArrowDark.png'),
      ),
    );
  }
}
