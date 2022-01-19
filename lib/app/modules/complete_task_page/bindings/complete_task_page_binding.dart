import 'package:get/get.dart';
import 'package:todo/app/modules/all_task_page/controllers/all_task_page_controller.dart';

import '../controllers/complete_task_page_controller.dart';

class CompleteTaskPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllTaskPageController>(
      () => AllTaskPageController(),
    );
    Get.lazyPut<CompleteTaskPageController>(
      () => CompleteTaskPageController(),
    );
  }
}
