import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttachmentBar extends StatelessWidget {
  const AttachmentBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      child: Row(
        children: [
          SizedBox(
            width: 24.w,
          ),
          Image.asset(
            'assets/icons/cameraDark.png',
            width: 30.w,
            height: 30.w,
          ),
          SizedBox(
            width: 24.w,
          ),
          Image.asset(
            'assets/icons/folderDark.png',
            width: 30.w,
            height: 30.w,
          ),
        ],
      ),
    );
  }
}
