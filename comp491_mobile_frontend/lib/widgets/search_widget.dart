import 'package:comp491_mobile_frontend/constants/app_colors.dart';
import 'package:comp491_mobile_frontend/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 282.w,
          height: 36.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.sp),
            color: AppColors.orange.withOpacity(0.25),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  hintStyle: TextStyles.secondTextStyle.copyWith(
                    color: AppColors.darkBackgroundColor,
                    fontSize: 16.sp,
                  )),
              style: TextStyles.secondTextStyle.copyWith(
                  color: AppColors.darkBackgroundColor, fontSize: 16.sp),
              maxLines: 1,
            ),
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        Image.asset(
          'assets/icons/searchDark.png',
          width: 24.w,
          height: 24.w,
        )
      ],
    );
  }
}
