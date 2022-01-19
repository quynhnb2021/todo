import 'package:get/get.dart';
import 'package:todo/app/modules/all_task_page/controllers/all_task_page_controller.dart';

import '../controllers/incomplete_task_page_controller.dart';

class IncompleteTaskPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllTaskPageController>(
      () => AllTaskPageController(),
    );
    Get.lazyPut<IncompleteTaskPageController>(
      () => IncompleteTaskPageController(),
    );
  }
}
