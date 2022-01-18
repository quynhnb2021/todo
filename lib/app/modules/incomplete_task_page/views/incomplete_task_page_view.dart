import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo/app/models/task_model.dart';

import '../controllers/incomplete_task_page_controller.dart';

class IncompleteTaskPageView extends GetView<IncompleteTaskPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InComplete'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: controller.inCompleteTask.length > 0
            ? Obx(
                () => ListView.builder(
                  itemCount: controller.inCompleteTask.length,
                  itemBuilder: (context, index) => allTask(
                    controller.inCompleteTask[index],
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
              task.name ?? "",
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
