import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo/app/models/task_model.dart';

import '../controllers/complete_task_page_controller.dart';

class CompleteTaskPageView extends GetView<CompleteTaskPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complete'),
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
                  'No data, please create the task new',
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
            Checkbox(value: task.status ?? false, onChanged: (bool? value) {})
          ],
        ),
      );
}
