import 'package:auto_size_text/auto_size_text.dart';
import 'package:comp491_mobile_frontend/constants/app_colors.dart';
import 'package:comp491_mobile_frontend/constants/text_styles.dart';
import 'package:comp491_mobile_frontend/controllers/post_controller.dart';
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
  final String? assetUrl;
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
      this.profileAsset,
      this.assetUrl});

  @override
  Widget build(BuildContext context) {
    PostController controller = Get.put(PostController(), tag: key.toString());
    return GestureDetector(
      onDoubleTap: () => controller.like(),
      child: Container(
        width: 375.w,
        height: 431.h,
        child: Column(
          children: [
            Container(
              width: 375.w,
              height: 0.2,
              decoration: BoxDecoration(
                  color: AppColors.darkBackgroundColor.withOpacity(0.3)),
            ),
            SizedBox(
              height: 12.h,
            ),
            /* top row */
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
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
                        style:
                            TextStyles.mainTextStyle.copyWith(fontSize: 10.sp),
                      ),
                      Text(
                        "5d",
                        textAlign: TextAlign.start,
                        style:
                            TextStyles.mainTextStyle.copyWith(fontSize: 10.sp),
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
            ),
            SizedBox(
              height: 10.h,
            ),
            /* content area */
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  Container(
                    width: 327.h,
                    height: 327.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    child: (assetUrl != null)
                        ? ContentNetworkWidget(
                            type: type,
                            assetUrl: assetUrl,
                            text: text,
                          )
                        : ContentWidget(
                            type: type,
                            asset: asset,
                            text: text,
                          ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            /* bottom row */
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  IconButtonWidget(
                    asset: 'assets/icons/messageDark.png',
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 24.w,
                  ),
                  Obx(() {
                    return IconButtonWidget(
                      asset: controller.isLiked.value
                          ? 'assets/icons/heartRed.png'
                          : 'assets/icons/heartDark.png',
                      onTap: () {
                        controller.like();
                      },
                    );
                  }),
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
            ),
            SizedBox(
              height: 12.h,
            ),
            Container(
              width: 375.w,
              height: 1,
              decoration: BoxDecoration(
                  color: AppColors.darkBackgroundColor.withOpacity(0.3)),
            ),
          ],
        ),
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
            height: 110.h,
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.sp),
                    child: Image.asset(
                      asset!,
                      fit: BoxFit.cover,
                    ),
                  ),
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

class ContentNetworkWidget extends StatelessWidget {
  final String? text;
  final String? assetUrl;
  final PostType type;
  const ContentNetworkWidget(
      {super.key, this.text, this.assetUrl, required this.type});

  @override
  Widget build(BuildContext context) {
    if (type == PostType.assetAndText) {
      return Column(
        children: [
          Container(
            width: 327.w,
            height: 110.h,
            child: AutoSizeText(
              text ?? "",
              style: TextStyles.mainTextStyle,
              maxLines: 4,
              textAlign: TextAlign.start,
            ),
          ),
          assetUrl != null
              ? Container(
                  width: 327.h,
                  height: 206.h,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10.sp)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.sp),
                    child: Image.network(
                      assetUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Container()
        ],
      );
    } else {
      return assetUrl != null
          ? Container(
              width: 327.h,
              height: 327.h,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10.sp)),
              child: Image.network(assetUrl!),
            )
          : Container();
    }
  }
}

enum PostType {
  assetOnly,
  assetAndText;
}
