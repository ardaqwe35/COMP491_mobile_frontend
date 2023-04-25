import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RootScreenController extends GetxController {
  double actualWidth = 0;
  double actualHeight = 0;
  double ratioWidth = ScreenUtil().scaleWidth;
  double ratioHeight = ScreenUtil().scaleHeight;
  RxInt pageIndex = 0.obs;

  void changePage(int index) {
    pageIndex.value = index;
  }

  handleTapDown(TapDownDetails tapDownDetails, BuildContext context) {
    Offset loc = tapDownDetails.localPosition;
    double dx = actualToDesignDx(loc.dx);
    if (dx <= 125.w) {
      changePage(0);
    } else if (loc.dx.w > 250.w && loc.dx <= 375.w) {
      changePage(1);
    } else {
      changePage(0);
    }
  }

  double actualToDesignDx(double actualDx) {
    return actualDx / ratioWidth;
  }

  double actualToDesignDy(double actualDy) {
    return actualDy / ratioHeight;
  }
}
