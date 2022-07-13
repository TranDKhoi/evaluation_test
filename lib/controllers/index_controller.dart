import 'package:get/get.dart';

class IndexController extends GetxController {
  //singleton
  IndexController._initInstance();
  static IndexController ins = IndexController._initInstance();

  var currentIndex = 0.obs;

  increaseIndex() {
    currentIndex.value++;
  }

  resetIndex() {
    currentIndex.value = 0;
  }
}
