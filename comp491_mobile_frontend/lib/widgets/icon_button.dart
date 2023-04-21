import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IconButtonWidget extends StatelessWidget {
  final String? asset;
  final VoidCallback onTap;
  const IconButtonWidget({super.key, this.asset, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24.w,
        height: 24.w,
        child: Image.asset(asset ?? 'assets/icons/leftArrowDark.png'),
      ),
    );
  }
}
