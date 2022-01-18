import 'package:get/get.dart';
import 'package:todo/app/models/task_model.dart';
import 'package:todo/app/modules/complete_task_page/controllers/complete_task_page_controller.dart';
import 'package:todo/app/modules/incomplete_task_page/controllers/incomplete_task_page_controller.dart';

class AllTaskPageController extends GetxController {
  //TODO: Implement AllTaskPageController

  final tasks = [
    Task(name: "A1", status: true),
    Task(name: "A2", status: false),
    Task(name: "B1", status: false),
    Task(name: "B1", status: true),
    Task(name: "Ab1", status: true),
    Task(name: "A1", status: true),
    Task(name: "A2", status: false),
    Task(name: "B1", status: false),
    Task(name: "B1", status: true),
    Task(name: "Ab1", status: true)
  ].obs;
  final isChecked = false.obs;
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
  tapCheckBox(bool? checked) {
    isChecked.value = checked ?? false;
  }

  tapSubmit(String text) {
    tasks.insert(0, Task(name: text, status: isChecked.value));
    Get.find<CompleteTaskPageController>().completeTask.value =
        tasks.where((e) => e.status == true).toList();
    Get.find<IncompleteTaskPageController>().inCompleteTask.value =
        tasks.where((e) => e.status == false).toList();
    update();
  }
}
