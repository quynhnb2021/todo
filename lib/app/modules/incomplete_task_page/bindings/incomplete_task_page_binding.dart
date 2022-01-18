import 'package:get/get.dart';

import '../controllers/incomplete_task_page_controller.dart';

class IncompleteTaskPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IncompleteTaskPageController>(
      () => IncompleteTaskPageController(),
    );
  }
}
