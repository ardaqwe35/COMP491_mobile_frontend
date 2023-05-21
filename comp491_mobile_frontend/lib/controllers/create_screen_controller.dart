import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CreateScreenController extends GetxController {
  Rx<FocusNode> kbTitle = FocusNode().obs;
  Rx<FocusNode> kbBody = FocusNode().obs;

  RxBool kbTitleHasFocus = false.obs;
  RxBool kbBodyHasFocus = false.obs;
}
