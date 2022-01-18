import 'package:get/get.dart';
import 'package:todo/app/modules/all_task_page/controllers/all_task_page_controller.dart';
import 'package:todo/app/modules/complete_task_page/controllers/complete_task_page_controller.dart';
import 'package:todo/app/modules/incomplete_task_page/controllers/incomplete_task_page_controller.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AllTaskPageController());
    Get.put(IncompleteTaskPageController());
    Get.put(CompleteTaskPageController());
    Get.lazyPut<MainController>(
      () => MainController(),
    );
  }
}
