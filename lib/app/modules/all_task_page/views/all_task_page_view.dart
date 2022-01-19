import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:todo/app/models/task_model.dart';

import '../controllers/all_task_page_controller.dart';

class AllTaskPageView extends GetView<AllTaskPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showDialog(context: context, builder: (context) => TextFieldAlertDialog());
              },
              child: Text(
                "Create task",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Obx(
              () => Expanded(
                child: controller.tasks.length > 0
                    ? ListView.builder(
                        itemCount: controller.tasks.length,
                        itemBuilder: (context, index) => allTask(controller.tasks[index]),
                      )
                    : Center(
                        child: Text(
                          'No data, please create the task new',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
              ),
            )
          ],
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

// ignore: must_be_immutable
class TextFieldAlertDialog extends StatelessWidget {
  TextEditingController taskTextField = TextEditingController();
  final controller = Get.find<AllTaskPageController>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return AlertDialog(
      title: const Text('Create task'),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * 8 / 10,
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: taskTextField,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(hintText: "Wrire task here ..."),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Obx(
            () => Checkbox(
                value: controller.isChecked.value,
                onChanged: (bool? value) {
                  controller.tapCheckBox(value);
                }),
          )
        ],
      ),
      actions: [
        TextButton(
          child: const Text('SUBMIT'),
          onPressed: () {
            if (taskTextField.text.isEmpty) {
              Fluttertoast.showToast(
                msg: "Please fill task above",
              );
              return;
            }
            controller.tapSubmit(taskTextField.text);
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
