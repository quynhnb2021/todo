import 'package:get/get.dart';

class MainController extends GetxController {
  //TODO: Implement MainController
  final tabIndex = 1.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void changeTabIndex(int index) async {
    tabIndex.value = index;
    switch (index) {
      case 0:
        break;
      case 1:
        break;
      default:
    }
  }
}
