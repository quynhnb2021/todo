import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo/app/models/task_model.dart';

import '../controllers/complete_task_page_controller.dart';

class CompleteTaskView extends GetView<CompleteTaskPageController> {
  @override
  Widget build(BuildContext context) {
    return CompleteTaskPage(
      title: 'Complete Task',
      description: 'No data, please create the task new',
    );
  }
}

class CompleteTaskPage extends StatelessWidget {
  const CompleteTaskPage({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CompleteTaskPageController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: controller.completeTask.length > 0
            ? Obx(
                () => ListView.builder(
                  itemCount: controller.completeTask.length,
                  itemBuilder: (context, index) => allTask(
                    controller.completeTask[index],
                  ),
                ),
              )
            : Center(
                child: Text(
                  description,
                  style: TextStyle(fontSize: 20),
                ),
              ),
      ),
    );
  }

  allTask(Task task) => Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Text(
              task.title ?? "",
              style: TextStyle(fontSize: 18),
            )),
            SizedBox(
              width: 16,
            ),
            Checkbox(value: task.status, onChanged: (bool? value) {})
          ],
        ),
      );
}
