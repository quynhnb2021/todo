import 'package:get/get.dart';
import 'package:todo/app/modules/all_task_page/controllers/all_task_page_controller.dart';

class IncompleteTaskPageController extends GetxController {
  //TODO: Implement IncompleteTaskPageController

  var inCompleteTask = [].obs;
  @override
  void onInit() {
    super.onInit();
    final data = Get.find<AllTaskPageController>().tasks;
    inCompleteTask.value = data.where((e) => e.status == false).toList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
