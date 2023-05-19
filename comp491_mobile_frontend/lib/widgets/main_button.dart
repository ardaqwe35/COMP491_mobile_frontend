import 'package:auto_size_text/auto_size_text.dart';
import 'package:comp491_mobile_frontend/constants/app_colors.dart';
import 'package:comp491_mobile_frontend/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButton extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;
  final String label;
  final TextStyle? labelStyle;
  final VoidCallback onTap;
  final bool isDisable;
  final EdgeInsets? verticalPadding;
  final double? borderWidth;
  final Color? borderColor;

  const MainButton({
    Key? key,
    this.color,
    this.height,
    required this.label,
    this.labelStyle,
    required this.onTap,
    required this.isDisable,
    this.verticalPadding,
    this.borderWidth,
    this.borderColor,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisable ? null : onTap,
      child: Opacity(
        opacity: isDisable ? 0.5 : 1,
        child: Container(
          width: width ?? 327.w,
          height: height ?? 60.h,
          padding: verticalPadding ?? EdgeInsets.symmetric(vertical: 18.h),
          decoration: BoxDecoration(
            color: color ?? AppColors.mainColor,
            borderRadius: BorderRadius.circular(30.sp),
            border: (borderWidth != null && borderColor != null)
                ? Border.all(color: borderColor!, width: borderWidth!)
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                label,
                style: labelStyle ?? TextStyles.mainTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
