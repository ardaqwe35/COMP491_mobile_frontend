import 'package:auto_size_text/auto_size_text.dart';
import 'package:comp491_mobile_frontend/constants/text_styles.dart';
import 'package:comp491_mobile_frontend/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopMenu extends StatelessWidget {
  final String text;
  const TopMenu({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 65.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          BackButtonWidget(
            asset: 'assets/icons/backbuttondark.png',
          ),
          AutoSizeText(
            text,
            style: TextStyles.mainTextStyle
                .copyWith(fontSize: 32.sp, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
