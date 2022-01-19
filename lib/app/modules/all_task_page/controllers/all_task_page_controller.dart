import 'package:get/get.dart';
import 'package:todo/app/database/notes_database.dart';
import 'package:todo/app/models/task_model.dart';
import 'package:todo/app/modules/complete_task_page/controllers/complete_task_page_controller.dart';
import 'package:todo/app/modules/incomplete_task_page/controllers/incomplete_task_page_controller.dart';

class AllTaskPageController extends GetxController {
  //TODO: Implement AllTaskPageController

  final tasks = [
    // Task(name: "A1", status: true),
    // Task(name: "A2", status: false),
    // Task(name: "B1", status: false),
    // Task(name: "B1", status: true),
    // Task(name: "Ab1", status: true),
    // Task(name: "A1", status: true),
    // Task(name: "A2", status: false),
    // Task(name: "B1", status: false),
    // Task(name: "B1", status: true),
    // Task(name: "Ab1", status: true)
  ].obs;
  final isChecked = false.obs;
  @override
  void onInit() async {
    super.onInit();
    tasks.value = await NotesDatabase.instance.readAllNotes();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    NotesDatabase.instance.close();
  }

  tapCheckBox(bool? checked) {
    isChecked.value = checked ?? false;
  }

  tapSubmit(String text) async {
    final task = Task(
      title: text,
      status: isChecked.value,
      createdTime: DateTime.now(),
    );

    tasks.insert(0, task);
    Get.find<CompleteTaskPageController>().completeTask.value = tasks.where((e) => e.status == true).toList();
    Get.find<IncompleteTaskPageController>().inCompleteTask.value = tasks.where((e) => e.status == false).toList();
    update();
    await NotesDatabase.instance.create(task);
  }
}
