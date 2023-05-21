import 'package:get/get.dart';

class PostController extends GetxController {
  RxBool isLiked = false.obs;

  void like() {
    isLiked.value = !isLiked.value;
  }
}
