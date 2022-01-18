import 'package:get/get.dart';
import 'package:todo/app/modules/all_task_page/controllers/all_task_page_controller.dart';

class CompleteTaskPageController extends GetxController {
  //TODO: Implement CompleteTaskPageController

  var completeTask = [].obs;
  @override
  void onInit() {
    super.onInit();
    final data = Get.find<AllTaskPageController>().tasks;
    completeTask.value = data.where((e) => e.status == true).toList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
