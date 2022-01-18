import 'package:get/get.dart';

import '../controllers/all_task_page_controller.dart';

class AllTaskPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllTaskPageController>(
      () => AllTaskPageController(),
    );
  }
}
