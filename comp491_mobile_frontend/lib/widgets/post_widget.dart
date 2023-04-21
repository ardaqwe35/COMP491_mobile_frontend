import 'package:auto_size_text/auto_size_text.dart';
import 'package:comp491_mobile_frontend/constants/app_colors.dart';
import 'package:comp491_mobile_frontend/constants/text_styles.dart';
import 'package:comp491_mobile_frontend/widgets/icon_button.dart';
import 'package:comp491_mobile_frontend/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PostWidget extends StatelessWidget {
  final String? asset;
  final String? profileAsset;
  final String? text;
  final PostType type;
  final String profileName;
  final String profileUrl;

  const PostWidget(
      {super.key,
      required this.type,
      required this.profileName,
      required this.profileUrl,
      this.asset,
      this.text,
      this.profileAsset});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 475.h,
      child: Column(
        children: [
          /* top row */
          Row(
            children: [
              Image.asset(
                profileAsset ?? 'assets/icons/user.png',
                width: 24.w,
                height: 24.w,
              ),
              SizedBox(
                width: 8.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /* username and date text */
                  Text(
                    "@fluffy",
                    style: TextStyles.mainTextStyle.copyWith(fontSize: 10.sp),
                  ),
                  Text(
                    "5d",
                    textAlign: TextAlign.start,
                    style: TextStyles.mainTextStyle.copyWith(fontSize: 10.sp),
                  ),
                ],
              ),
              const Spacer(),
              MainButton(
                  width: 70.w,
                  height: 28.h,
                  label: 'Gild',
                  labelStyle: TextStyles.mainTextStyle.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.white,
                  ),
                  verticalPadding: EdgeInsets.zero,
                  onTap: () {},
                  isDisable: false),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          /* content area */
          Column(
            children: [
              Container(
                width: 327.h,
                height: 327.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: ContentWidget(
                  type: type,
                  asset: asset,
                  text: text,
                ),
              )
            ],
          ),
          /* bottom row */
          Row(
            children: [
              IconButtonWidget(
                asset: 'assets/icons/messageDark.png',
                onTap: () {},
              ),
              SizedBox(
                width: 24.w,
              ),
              IconButtonWidget(
                asset: 'assets/icons/heartDark.png',
                onTap: () {},
              ),
              SizedBox(
                width: 183.w,
              ),
              IconButtonWidget(
                asset: 'assets/icons/downArrowDark.png',
                onTap: () {},
              ),
              SizedBox(
                width: 24.w,
              ),
              IconButtonWidget(
                asset: 'assets/icons/upRightArrowDark.png',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  final String? text;
  final String? asset;
  final PostType type;
  const ContentWidget({super.key, this.text, this.asset, required this.type});

  @override
  Widget build(BuildContext context) {
    if (type == PostType.assetAndText) {
      return Column(
        children: [
          Container(
            width: 327.w,
            child: AutoSizeText(
              text ?? "",
              style: TextStyles.mainTextStyle,
              maxLines: 4,
              textAlign: TextAlign.start,
            ),
          ),
          asset != null
              ? Container(
                  width: 327.h,
                  height: 206.h,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10.sp)),
                  child: Image.asset(asset!),
                )
              : Container()
        ],
      );
    } else {
      return asset != null
          ? Container(
              width: 327.h,
              height: 327.h,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10.sp)),
              child: Image.asset(asset!),
            )
          : Container();
    }
  }
}

enum PostType {
  assetOnly,
  assetAndText;
}
