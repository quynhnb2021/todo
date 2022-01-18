import 'package:get/get.dart';

class MainController extends GetxController {
  //TODO: Implement MainController
  final tabIndex = 0.obs;

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
  }
}
