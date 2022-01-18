import 'package:get/get.dart';

import '../controllers/complete_task_page_controller.dart';

class CompleteTaskPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompleteTaskPageController>(
      () => CompleteTaskPageController(),
    );
  }
}
